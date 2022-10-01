FactoryBot.define do
  factory :user do
    confirmation_token { "1234" }
    remember_token { "5678" }
    password { "hi" }
    encrypted_password { "$2a$12$5vI1uLLUcNBKaJ.jxu1pdOrM3LPJmkzBtK270IqCfYRqns3j7oBZW" }

    sequence(:username) { |n| "username#{n}" }
    sequence(:email) { |n| "ailurus#{n}@fulgens.com" }
  end
end
