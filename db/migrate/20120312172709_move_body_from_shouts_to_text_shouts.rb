class MoveBodyFromShoutsToTextShouts < ActiveRecord::Migration
  def up
    add_column :shouts, :medium_type, :string
    add_column :shouts, :medium_id, :integer

    select_all("SELECT id, body, created_at, updated_at FROM shouts").each do |shout|
      id = insert <<-SQL
        INSERT INTO text_shouts (body, created_at, updated_at)
        VALUES("#{shout["body"]}", "#{shout["created_at"]}", "#{shout["updated_at"]}")
      SQL
      update <<-SQL
        UPDATE shouts
        SET medium_type="TextShout", medium_id=#{id}
        WHERE shouts.id = #{shout["id"]}
      SQL
    end

    remove_column :shouts, :body
  end

  def down
    add_column :shouts, :body, :text
    select_all("SELECT id, body FROM text_shouts").each do |text_shout|
      update <<-SQL
        UPDATE shouts
        SET body="#{text_shout["body"]}"
        WHERE medium_id=#{text_shout["id"]}
      SQL
    end
    remove_column :shouts, :medium_type
    remove_column :shouts, :medium_id
    delete("DELETE FROM text_shouts")
  end
end
