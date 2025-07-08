FactoryBot.define do
  factory :bookmark do
    user { create(:user) }
    meal { create(:meal) }
  end
end
