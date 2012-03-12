class CreateTextShouts < ActiveRecord::Migration
  def change
    create_table :text_shouts do |t|
      t.text :body

      t.timestamps
    end
  end
end
