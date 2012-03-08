# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name

Adventure.delete_all
Venue.delete_all
Checkpoint.delete_all
adventure = Adventure.create! :name => 'Startup Bus NYC 2012', :description => 'Description here'

venues = {}
["4bded100921d952185016932", "4b05866ef964a520e16122e3", "4b058660f964a520465f22e3", "4b37d793f964a520454725e3", "4ad4c000f964a5208ceb20e3"].each do |id|
  venues[id] = Venue.fetch_and_add!(id)
end

adventure.checkpoints.create!({:tout => "tout nyc", :description => "desc", :venue_id => venues['4bded100921d952185016932']})
adventure.checkpoints.create!({:tout => "tout nash", :description => "desc", :venue_id => venues['4b05866ef964a520e16122e3']})
adventure.checkpoints.create!({:tout => "tout grace", :description => "desc", :venue_id => ['4b058660f964a520465f22e3'] })
adventure.checkpoints.create!({:tout => "tout baton", :description => "desc", :venue_id => ['4b37d793f964a520454725e3']})
adventure.checkpoints.create!({:tout => "tout san", :description => "desc", :venue_id => ['4ad4c000f964a5208ceb20e3']})
   
