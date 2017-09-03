namespace :db do
	desc "populates users, posts, comments, projects & Tags"
	task populate: :environment do
		Poll.destroy_all
		User.destroy_all
		Project.destroy_all
		ActsAsTaggableOn::Tag.destroy_all
		Announcement.destroy_all
		20.times do
			User.create(
				provider: Faker::Omniauth.google[:provider],
				uid: Faker::Omniauth.google[:uid],
				name: Faker::Omniauth.google[:info][:name],
				email: Faker::Omniauth.google[:info][:email],
				password: Devise.friendly_token[0,20],
				image: Faker::Omniauth.google[:info][:image],
				oauth_refresh_token: Faker::Omniauth.google[:credentials][:refresh_token],
				oauth_token: Faker::Omniauth.google[:credentials][:token],
				oauth_expires_at: Time.at(Faker::Omniauth.google[:credentials][:expires_at]),
				hd: Faker::Omniauth.google[:extra][:raw_info][:hd],
				gender: Faker::Omniauth.google[:extra][:raw_info][:gender],
				profile: Faker::Omniauth.google[:extra][:raw_info][:profile]				
			)
		end

		User.all.each do |user|		
			2.times do
				user.posts.create(
					title: Faker::GameOfThrones.character, 
					description: Faker::Lorem.paragraphs(5).join(' '),
					featured: false,
					image: ""
					)
			end
			user.posts.each do |post|
				post.comments.create body: Faker::Lorem.paragraphs(1).join, user_id: user.id
			end
		end

		10.times do
			Project.create(name: Faker::Lorem.word.split.map(&:upcase).join, code: Faker::Number.number(1))
		end

		5.times do
			ActsAsTaggableOn::Tag.create(name: Faker::Lorem.word)
		end

		Post.all[0..3].each do |featured_post|
			featured_post.featured = true
			featured_post.save
		end

		10.times do
			Announcement.create title: Faker::GameOfThrones.character, content: Faker::Lorem.paragraphs(2).join(' ')
		end

		Category.destroy_all
		Category.create name: "HR Policies"
		Category.create name: "IT Policies"
		Category.create name: "ISO Certification"
		Category.create name: "Finance"
		Category.create name: "Stima Sacco"
		
	end

end