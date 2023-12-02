# test/factories/posts.rb
FactoryBot.define do
  factory :post do
    title { 'Example Post' }
    text { 'This is the content of the post' }
    association :author, factory: :user
    comments_counter { 0 } # Set default value for comments_counter
    likes_counter { 0 } # Set default value for likes_counter
  end
end
