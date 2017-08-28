namespace :db do
	desc "populates database with random data"
	task populate: :environment do
		Post.destroy_all
		20.times do
			Post.create(
				title: Faker::GameOfThrones.character, 
				description: Faker::Lorem.paragraphs(5).join(' '), 
				image: ""
				)
		end
	end
end