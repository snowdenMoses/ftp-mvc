FactoryBot.define do
  factory :comment do
    commentable { nil }
    content { "MyText" }
    user { nil }
  end
end
