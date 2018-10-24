# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
	user = User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email
		)
end

5.times do 
	category = Category.create!(
		name: Faker::IndustrySegments.sector
		)
end

10.times do
	article = Article.create!(
		title: Faker::Lorem.sentence, 
		content: Faker::Lorem.paragraph, 
		category_id: Faker::Number.within(Category.first.id..Category.last.id), 
		user_id: Faker::Number.within(User.first.id..User.last.id)
	)
end

15.times do
	like = Like.create!(
		article_id: Faker::Number.within(Article.first.id..Article.last.id), 
		user_id: Faker::Number.within(User.first.id..User.last.id)
		)
end


15.times do
	comment = Comment.create!(
		content: Faker::Lorem.paragraph, 
		article_id: Faker::Number.within(Article.first.id..Article.last.id), 
		user_id: Faker::Number.within(User.first.id..User.last.id)
		)
end