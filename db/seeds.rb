# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'testtest',
    password_confirmation: 'testtest'
  )
end

10.times do
  Post.create!(
    title: Faker::Hipster.words(1).join(". "),
    content: Faker::Hipster.sentences.join(". "),
    author_id: Faker::Number.between(1, 10)
  )
end

10.times do
  Comment.create!(
    content: Faker::Hipster.sentence,
    user_id: Faker::Number.between(1, 10),
    post_id: Faker::Number.between(1, 10)
  )
end

10.times do
  Category.create!(
    title: Faker::Hacker.noun
  )
end

10.times do
  PostCategory.create!(
  post_id: Faker::Number.between(1, 10),
  category_id: Faker::Number.between(1, 10)
  )
end
