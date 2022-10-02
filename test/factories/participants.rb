FactoryBot.define do
  factory :participant do
    user { create(:user) }
    game { create(:game) }
    present { true }
    action_points { 1 }
    pace { 1.5 }
  end
end
