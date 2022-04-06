FactoryBot.define do
  factory :article do
    title { "News about Sports" }
    body { "Lorem ipsum..." }
    author { "MyString" }
    category
  end
end
