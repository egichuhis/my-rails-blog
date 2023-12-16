# test/factories/user.rb
FactoryBot.define do
  factory :user do
    name { 'Tom' }
    photo { 'https://example.com/path/to/your/photo.jpg' }
    bio { 'Teacher from Mexico.' }
    posts_counter { 0 }
  end
end
