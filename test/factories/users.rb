FactoryBot.define do
  factory :user do
    confirmation_token { FFaker::Guid.unique.guid }
    remember_token { FFaker::Guid.unique.guid }
    password { "hi" }
    encrypted_password { "$2a$12$5vI1uLLUcNBKaJ.jxu1pdOrM3LPJmkzBtK270IqCfYRqns3j7oBZW" }

    sequence(:username) { |n| "#{FFaker::Internet.user_name}#{n}" }
    email { "#{username}@#{FFaker::Internet.domain_name}" }
  end
end
