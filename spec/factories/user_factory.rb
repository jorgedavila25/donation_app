FactoryGirl.define do
  factory :user do
    email "jdavila@me.com"
    password "12345678"
    password_confirmation "12345678"

    factory :user_with_donations do
      after(:create) do |user, evaluator|
        create_list(:donation, 5, user: user)
      end
    end
  end
end
