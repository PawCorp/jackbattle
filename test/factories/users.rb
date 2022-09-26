FactoryBot.define do
  factory :user do
    email { "ailurus@fulgens.com" }
    confirmation_token { "1234" }
    remember_token { "5678" }
    password { "hi" }
    encrypted_password { "$2a$12$5vI1uLLUcNBKaJ.jxu1pdOrM3LPJmkzBtK270IqCfYRqns3j7oBZW" }
  end
end
