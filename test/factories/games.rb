FactoryBot.define do
  factory :game do
    creator factory: :user

    name { FFaker::Game.title }
  end
end
