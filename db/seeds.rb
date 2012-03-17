# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#puts 'SETTING UP DEFAULT USER LOGIN'
#user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user.name

Adventure.delete_all
Venue.delete_all
Checkpoint.delete_all


# testing


#FakeWeb.allow_net_connect = false
venues = {}
[ "4bded100921d952185016932", "4b05866ef964a520e16122e3", "4b058660f964a520465f22e3", "4b37d793f964a520454725e3", "4ad4c000f964a5208ceb20e3", 
  "440fee99f964a520b2301fe3", "41536380f964a5201f1d1fe3", "47e2990df964a520434e1fe3", "40b13b00f964a520aaf31ee3", "43e5cda9f964a520f92e1fe3",
  "40b13b00f964a52083f31ee3", "4a5684e3f964a52051b51fe3", "43598100f964a520eb281fe3",
  "45f19148f964a520cf431fe3", "40fb0f00f964a520fc0a1fe3", "45fbfa6df964a5206c441fe3", "4b255d5bf964a520b47024e3", 
  "4b253b76f964a5206b6e24e3", "4beb1a5062c0c92811b4e1d4", "4ac8fc7df964a520c3bd20e3", "4ac900a1f964a520ecbd20e3"
  ].each do |id|
 # FakeWeb.register_uri(:get, "https://api.foursquare.com/v2/venues/#{id}?client_id=#{Adventeur::Application.config.foursquare_id}&client_secret=#{Adventeur::Application.config.foursquare_secret}",
  #                 :response => File.expand_path("spec/faker/venues/#{id}.json"))
  
  venues[id] = Venue.fetch_and_add!(id)
  puts "seeded #{id}"
end

# Startup Bus adventure
adventure = Adventure.create! :name => 'Startup Bus NYC 2012', :description => 'Feel like trouble? Spend 72 hours on a bus and build a company at 65mph. (For a while we were buliding the company at 80mph, but we got pulled over).'
adventure.checkpoints.create!({:tout => "tout nyc", :description => "desc", :venue_id => venues['4bded100921d952185016932'].id, :latitude => venues['4bded100921d952185016932'].latitude, :longitude => venues['4bded100921d952185016932'].longitude })
adventure.checkpoints.create!({:tout => "tout nash", :description => "desc", :venue_id => venues['4b05866ef964a520e16122e3'].id, :latitude => venues['4b05866ef964a520e16122e3'].latitude, :longitude => venues['4b05866ef964a520e16122e3'].longitude })
adventure.checkpoints.create!({:tout => "tout grace", :description => "desc", :venue_id => venues['4b058660f964a520465f22e3'].id, :latitude => venues['4b058660f964a520465f22e3'].latitude, :longitude => venues['4b058660f964a520465f22e3'].longitude })
adventure.checkpoints.create!({:tout => "tout baton", :description => "desc", :venue_id => venues['4b37d793f964a520454725e3'].id, :latitude => venues['4b37d793f964a520454725e3'].latitude, :longitude => venues['4b37d793f964a520454725e3'].longitude })
adventure.checkpoints.create!({:tout => "tout san", :description => "desc", :venue_id => venues['4ad4c000f964a5208ceb20e3'].id, :latitude => venues['4ad4c000f964a5208ceb20e3'].latitude, :longitude => venues['4ad4c000f964a5208ceb20e3'].longitude })

# A Perfect Game of Foosball
adventure3 = Adventure.create! :name => 'A Perfect Game of Foosball', :description => 'Dark, dirty and with balls - just the adventure we were looking for. Tour some dive bars and get competitive.'
adventure3.checkpoints.create!({:tout => "Loud music in a dark place.", :description => "Our first stop was the Parish, where Slash was supposed to play later that evening.  Hung out in the corner booth anticipating the show.", :venue_id => venues['440fee99f964a520b2301fe3'].id, :latitude => venues['440fee99f964a520b2301fe3'].latitude, :longitude => venues['440fee99f964a520b2301fe3'].longitude })
adventure3.checkpoints.create!({:tout => "Longtime Austinites remember when the Red Eyed Fly was home to Wilco.", :description => "The Red Eyed Fly was always famous for discovering musicians before they got big. Keep an eye on whoever you see play there.", :venue_id => venues['41536380f964a5201f1d1fe3'].id, :latitude => venues['41536380f964a5201f1d1fe3'].latitude, :longitude => venues['41536380f964a5201f1d1fe3'].longitude })
adventure3.checkpoints.create!({:tout => "If I could be at the Boiling Pot right now, I'd be happy.", :description => "Seafood at it's messiest. Delicious cajun mix of crab, shrimp, sausage corn and potatoes dumped right on the table and ready to eat.", :venue_id => venues['47e2990df964a520434e1fe3'].id, :latitude => venues['47e2990df964a520434e1fe3'].latitude, :longitude => venues['47e2990df964a520434e1fe3'].longitude })
adventure3.checkpoints.create!({:tout => "Preacher's collar with an IPA chaser", :description => "You could come here every day for 4 months and never drink the same beer twice.", :venue_id => venues['40b13b00f964a520aaf31ee3'].id, :latitude => venues['40b13b00f964a520aaf31ee3'].latitude, :longitude => venues['40b13b00f964a520aaf31ee3'].longitude })
adventure3.checkpoints.create!({:tout => "Rack 'em, shoot 'em, sink 'em.", :description => "We learned there's no such thing as a friendly game, and the fooz is brutal.  Live by the ball, die by the ball.", :venue_id => venues['43e5cda9f964a520f92e1fe3'].id, :latitude => venues['43e5cda9f964a520f92e1fe3'].latitude, :longitude => venues['43e5cda9f964a520f92e1fe3'].longitude })

# My Accidental Karaoke
adventure4 = Adventure.create! :name => 'My Accidental Karaoke', :description => 'Out of tune and on the town. This adventure is filled with local creative expression. Look for the mobile karaoke RV on your tour!'
adventure4.checkpoints.create!({:tout => "Longtime Austinites remember when the Red Eyed Fly was home to Wilco.", :description => "The Red Eyed Fly was always famous for discovering musicians before they got big. Keep an eye on whoever you see play there.", :venue_id => venues['41536380f964a5201f1d1fe3'].id, :latitude => venues['41536380f964a5201f1d1fe3'].latitude, :longitude => venues['41536380f964a5201f1d1fe3'].longitude })
adventure4.checkpoints.create!({:tout => "The long tail of swank.", :description => "Open for 100 years with the finest patios in town.  Everyone comes through here eventually.  Grab a seat at a bar and let the world revolve around you.", :venue_id => venues['40b13b00f964a52083f31ee3'].id, :latitude => venues['40b13b00f964a52083f31ee3'].latitude, :longitude => venues['40b13b00f964a52083f31ee3'].longitude })
adventure4.checkpoints.create!({:tout => "Stay for a while.", :description => "Lamb and goat burger, inventive art. Love the small french feel hidden away on the other side of the freeway.", :venue_id => venues['4a5684e3f964a52051b51fe3'].id, :latitude => venues['4a5684e3f964a52051b51fe3'].latitude, :longitude => venues['4a5684e3f964a52051b51fe3'].longitude })
adventure4.checkpoints.create!({:tout => "Beer-battered asparagus. Yes.", :description => "Warm atmosphere, southern food and strong drinks make this place perfect for any occasion.", :venue_id => venues['43598100f964a520eb281fe3'].id, :latitude => venues['43598100f964a520eb281fe3'].latitude, :longitude => venues['43598100f964a520eb281fe3'].longitude })
adventure4.checkpoints.create!({:tout => "If I could be at the Boiling Pot right now, I'd be happy.", :description => "Seafood at it's messiest. Delicious cajun mix of crab, shrimp, sausage corn and potatoes dumped right on the table and ready to eat.", :venue_id => venues['47e2990df964a520434e1fe3'].id, :latitude => venues['47e2990df964a520434e1fe3'].latitude, :longitude => venues['47e2990df964a520434e1fe3'].longitude })

# It came with Coleslaw
adventure5 = Adventure.create! :name => 'It came with Coleslaw', :description => 'A savory, smoky adventure sure to stick to your ribs. Loosen a few notches and grab a cold draft beer.'
adventure5.checkpoints.create!({:tout => "Time for some BBQ, and Iron Works.", :description => "Iron Works BBQ is justly famous for brisket and their secret sauce. Their large picnic tables and downtown location make it a ...", :venue_id => venues['45f19148f964a520cf431fe3'].id, :latitude => venues['45f19148f964a520cf431fe3'].latitude, :longitude => venues['45f19148f964a520cf431fe3'].longitude })
adventure5.checkpoints.create!({:tout => "Beer-battered asparagus. Yes.", :description => "Warm atmosphere, southern food and strong drinks make this place perfect for any occasion.", :venue_id => venues['43598100f964a520eb281fe3'].id, :latitude => venues['43598100f964a520eb281fe3'].latitude, :longitude => venues['43598100f964a520eb281fe3'].longitude })
adventure5.checkpoints.create!({:tout => "BBQ and Live Music. It does not get better.", :description => "Classic, steady Stubbs.  Try the brisket and chili. Definitely grab a Shiner and get ready to rock out!", :venue_id => venues['40fb0f00f964a520fc0a1fe3'].id, :latitude => venues['40fb0f00f964a520fc0a1fe3'].latitude, :longitude => venues['40fb0f00f964a520fc0a1fe3'].longitude })
adventure5.checkpoints.create!({:tout => "Lone Star Livin'. Finger Lickin'.", :description => "Downtown BBQ off the beaten path, but well worth it!  The most delicious wild boar ribs I've ever had.", :venue_id => venues['45fbfa6df964a5206c441fe3'].id, :latitude => venues['45fbfa6df964a5206c441fe3'].latitude, :longitude => venues['45fbfa6df964a5206c441fe3'].longitude })

# Vintage tour of austin
adventure2 = Adventure.create! :name => 'Vintage Tour of Austin', :description => 'Take a tour around the vintage shops of Austin and get some stylish threads. I guarentee that no one else will be wearing that dress.'
adventure2.checkpoints.create!({:tout => "Jewelry and champagne at Eliza Page.", :description => "A ShopAcrossTexas.com Best Store in Town, this Austin jewelry boutique carries upscale baubles from more than 30 independent designers, many of whom are Texas natives.", :venue_id => venues['4b255d5bf964a520b47024e3'].id, :latitude => venues['4b255d5bf964a520b47024e3'].latitude, :longitude => venues['4b255d5bf964a520b47024e3'].longitude })
adventure2.checkpoints.create!({:tout => "You'll want to MissBehave ;)", :description => "Just about the cutest boutique you will ever see. Fun, flirtatious, and very girly. A really fabulous atmosphere", :venue_id => venues['4b253b76f964a5206b6e24e3'].id, :latitude => venues['4b253b76f964a5206b6e24e3'].latitude, :longitude => venues['4b253b76f964a5206b6e24e3'].longitude })
adventure2.checkpoints.create!({:tout => "So much more than just another Austin boutique...", :description => "Girl Next Door is the Austin shopping experience for women, carrying the hottest designers on the market.", :venue_id => venues['4beb1a5062c0c92811b4e1d4'].id, :latitude => venues['4beb1a5062c0c92811b4e1d4'].latitude, :longitude => venues['4beb1a5062c0c92811b4e1d4'].longitude })
adventure2.checkpoints.create!({:tout => "Time for some Prototyping, dude!", :description => "Prototype Vintage Design offers furniture, art, fashion, jewelry, lighting, glassware and more in an environment both inviting and inspiring.", :venue_id => venues['4ac8fc7df964a520c3bd20e3'].id, :latitude => venues['4ac8fc7df964a520c3bd20e3'].latitude, :longitude => venues['4ac8fc7df964a520c3bd20e3'].longitude })
adventure2.checkpoints.create!({:tout => "Vintage finds at reasonable prices for dessert", :description => "Every vintage piece here is a winner, whether it's a batwing-sleeved dress, a Stevie Nicks-ish crystal pendant, or an appliqued silk peasant blouse.", :venue_id => venues['4ac900a1f964a520ecbd20e3'].id, :latitude => venues['4ac900a1f964a520ecbd20e3'].latitude, :longitude => venues['4ac900a1f964a520ecbd20e3'].longitude })

# First Date
adventure6 = Adventure.create! :name => 'Pamela & Jon\'s First Date', :description => 'This is a slightly fictionalized version of my first date with Pamela, drawing mostly from our first actual date and mixing in our first lunch date. We were married about 6 months after this happened.'
adventure6.checkpoints.create!({:tout => "First stop: stock up. You're going to a french movie, so pick up some french wine.", :description => "Beaujolais Nouveau in Poland Springs bottles worked for us. Trader Joe's Wine Shop may became a neighborhood staple overnight thanks to their outstanding selection and low prices.", :venue_id => venues['4a319883f964a520fc991fe3'].id, :latitude => venues['4a319883f964a520fc991fe3'].latitude, :longitude => venues['4a319883f964a520fc991fe3'].longitude })

adventure6.checkpoints.create!({:tout => "Sneak in your Beaujolais Nouveau take in some classic Film Noir.", :description => "We saw Classe Tous Risques, a noir gangster film, at The Quad Cinema. That movie hasn't played for a while, but its hard not to find something you'll love at the Quad.", :venue_id => venues['45aa540af964a52032411fe3'].id, :latitude => venues['45aa540af964a52032411fe3'].latitude, :longitude => venues['45aa540af964a52032411fe3'].longitude })

adventure6.checkpoints.create!({:tout => "'Pan-asian' is usually a cop-out, but this small spot is cozy and delicious.", :description => "In real life we went here for our first lunch date, but since we missed any food in this tour, we're retconning this one.", :venue_id => venues['3fd66200f964a5208dea1ee3'].id, :latitude => venues['3fd66200f964a5208dea1ee3'].latitude, :longitude => venues['3fd66200f964a5208dea1ee3'].longitude })

adventure6.checkpoints.create!({:tout => "Explore the seedy underworld of Tokyo...in Manhattan's East Village", :description => "Descend the steps to Decibel, and you'll feel like you've entered another world: Tokyo, around 2am. Close quarters, warm staff, great sake, and killer bar snacks. I love the mackerel. One of the three places in NYC where I'll wait on line.", :venue_id => venues['3fd66200f964a5203de41ee3'].id, :latitude => venues['3fd66200f964a5203de41ee3'].latitude, :longitude => venues['3fd66200f964a5203de41ee3'].longitude })

adventure6.checkpoints.create!({:tout => "Time for something sweet and boozy.", :description => "In truth, we went to Korova Milk Bar, a Kubrick-themed Clockwork Orange take-off. It's long-closed, so try David Chang's Momofuku Milk Bar instead.", :venue_id => venues['4a257482f964a520557e1fe3'].id, :latitude => venues['4a257482f964a520557e1fe3'].latitude, :longitude => venues['4a257482f964a520557e1fe3'].longitude })

# flashback, 
# big berthas, 
# uncommon goods, 
# new bohemia
#
# adventure2.checkpoints.create!({:tout => "tout nyc", :description => "desc", :venue_id => venues['4bded100921d952185016932'].id, :latitude => venues['4bded100921d952185016932'].latitude, :longitude => venues['4bded100921d952185016932'].longitude })
# adventure2.checkpoints.create!({:tout => "tout nash", :description => "desc", :venue_id => venues['4b05866ef964a520e16122e3'].id, :latitude => venues['4b05866ef964a520e16122e3'].latitude, :longitude => venues['4b05866ef964a520e16122e3'].longitude })
# adventure2.checkpoints.create!({:tout => "tout grace", :description => "desc", :venue_id => venues['4b058660f964a520465f22e3'].id, :latitude => venues['4b058660f964a520465f22e3'].latitude, :longitude => venues['4b058660f964a520465f22e3'].longitude })
# adventure2.checkpoints.create!({:tout => "tout baton", :description => "desc", :venue_id => venues['4b37d793f964a520454725e3'].id, :latitude => venues['4b37d793f964a520454725e3'].latitude, :longitude => venues['4b37d793f964a520454725e3'].longitude })
# adventure2.checkpoints.create!({:tout => "tout san", :description => "desc", :venue_id => venues['4ad4c000f964a5208ceb20e3'].id, :latitude => venues['4ad4c000f964a5208ceb20e3'].latitude, :longitude => venues['4ad4c000f964a5208ceb20e3'].longitude })
   

