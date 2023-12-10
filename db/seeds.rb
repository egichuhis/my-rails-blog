# seeds.rb

# Clear existing data
User.destroy_all

# Create users
first_user = User.create(
  name: 'Tom',
  photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  bio: 'Plumber from Mexico.'
)

second_user = User.create(
  name: 'Lilly',
  photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  bio: 'Teacher from Poland.'
)

third_user = User.create(
  name: 'Conny',
  photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  bio: 'Engineer from Holand.'
)

first_post = Post.create(author: first_user, title: 'Hello 1', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hello 2', text: 'This is my second post')
third_post = Post.create(author: second_user, title: 'Hello 1', text: 'This is my first post')
fourth_post = Post.create(author: second_user, title: 'Hello 2', text: 'This is my second post')
fifth_post = Post.create(author: third_user, title: 'Hello 1', text: 'This is my first post')

Comment.create(post: first_post, user: first_user, text: 'Hi Tom!' )
Comment.create(post: second_post, user: first_user, text: 'Hi Tom 2!' )
Comment.create(post: third_post, user: second_user, text: 'Hi Rom!' )
Comment.create(post: fourth_post, user: second_user, text: 'Hi Fom 2!' )
Comment.create(post: fifth_post, user: third_user, text: 'Hi Dom!' )


Like.create(post: first_post, user: first_user)
Like.create(post: second_post, user: first_user)
Like.create(post: fifth_post, user: third_user)

