FactoryBot.define do
  factory :participant do
    user { nil }
    game { nil }
    present { false }
    action_points { 1 }
    pace { 1.5 }
  end
end
