FactoryGirl.define do
  factory :shout do
    user
  end

  factory :text_shout do
    body "some text"
    shout
  end
end
