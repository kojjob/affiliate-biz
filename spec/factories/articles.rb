FactoryBot.define do
  factory :article, class: 'Content::Article' do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraphs(number: 5).join("\n\n") }
    meta_title { title }
    meta_description { Faker::Lorem.sentence }
    published { true }
  end
end
