FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 4)
    password { password }
    password_confirmation { password }
    profile { '適当なあいさつ' }
  end
end
