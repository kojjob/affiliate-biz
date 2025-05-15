FactoryBot.define do
  factory :click do
    affiliate_link { nil }
    ip_hash { "MyString" }
    referrer { "MyString" }
    user_agent { "MyString" }
  end
end
