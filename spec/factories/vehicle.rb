require 'faker'
FactoryGirl.define do
	factory :vehicle do
		plate "#{['abc','dfg'].sample}#{[*0..999].sample}"
		color Faker::Color.hex_color
		year [*1900..DateTime.now.year].sample
	end
end