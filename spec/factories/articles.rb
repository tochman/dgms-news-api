FactoryBot.define do
  factory :article do
    title { "News about coding" }
    body { "Lorem ipsum..." }
    author { "MyString" }
    category
  end
end
