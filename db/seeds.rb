# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

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

##### THE FOLLOWING METHODS CREATE 10 UNIQUE CATEGORIES ######
def initial_categories
  category_array = Array.new
  10.times do
    category_array << Faker::Hacker.noun
  end
  add_additional_titles(category_array)
end

def add_additional_titles(categories)
  uniq_categories = categories.uniq!
  titles_needed = 10 - categories.length

  if titles_needed == 0
    create_categories(categories)
  else
    titles_needed.times do
      uniq_categories << Faker::Hacker.noun
    end
    add_additional_titles(uniq_categories)
  end
end

def create_categories(categories)
  categories.each do |category|
    Category.create!(title: category)
  end
end

initial_categories
##############################################################

10.times do
  PostCategory.create!(
  post_id: Faker::Number.between(1, 10),
  category_id: Faker::Number.between(1, 10)
  )
end
