# test/factories/comments.rb
FactoryBot.define do
  factory :comment do
    text { 'Hi Tom!' }
    association :user, factory: :user
    association :post, factory: :post
  end
end
