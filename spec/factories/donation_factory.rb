FactoryGirl.define do
  factory :donation do
    title "This is one for the books"
    description "Great cause. Please contribute!"
    user
  end
end
