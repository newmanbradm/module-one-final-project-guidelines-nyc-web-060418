# how all your data should be loaded into your app
#Cities
nyc = City.create(name: "New York City")
miami = City.create(name: "Miami")
la = City.create(name: "Los Angeles")
boston = City.create(name: "Boston")
dc = City.create(name: "Washington DC")

#Travellers
brad = Traveller.create(name: "Brad Newman", email: "newmanbradm@gmail.com") #nyc, la, boston
brad_pitt = Traveller.create(name: "Brad Pitt", email: "mrsmith05@fakemail.com") #la, miami
david = Traveller.create(name: "David Zeit", email: "dzeit216@gmail.com") #nyc, miami, boston
david_hasselhoff = Traveller.create(name: "David Hasselhoff", email: "kitt2000@fakemail.com") #la, miami
tashawn = Traveller.create(name: "Tashawn Williams", email: "tashawn.williams@flatironschool.com") #nyc, dc
zach = Traveller.create(name: "Zach Vary", email: "zach.vary@flatironschool.com") #nyc, dc

#Attractions
#NYC
statue = Attraction.create(name: "Statue of Liberty Cruise", city: nyc, price: 20.0, family_friendly: true)
sfga = Attraction.create(name: "Six Flags Great Adventure", city: nyc, price: 60.0, family_friendly: true)
yankee = Attraction.create(name: "Yankee Stadium Tour", city: nyc, price: 25.0, family_friendly: false)
skating = Attraction.create(name: "Rockefeller Center Ice Rink", city: nyc, price: 50.0, family_friendly: true)
#Miami
jungle = Attraction.create(name: "Jungle Island", city: miami, price: 40.0, family_friendly: true)
hard_rock = Attraction.create(name: "Hard Rock Stadium Tour", city: miami, price: 25.0, family_friendly: false)
dolphin_swim = Attraction.create(name: "Miami Swim With Dolphin Tours", city: miami, price: 50.0, family_friendly: true)
church = Attraction.create(name: "St. Bernard de Clairvaux Church", city: miami, price: 0.0, family_friendly: false)
#LA
hollywood_tour = Attraction.create(name: "Ultimate Hollywood Tour", city: la, price: 50.0, family_friendly: true)
disney = Attraction.create(name: "Disneyland", city: la, price: 70.0, family_friendly: true)
dodger = Attraction.create(name: "Dodger Stadium Tour", city: la, price: 25.0, family_friendly: false)
hollywood_hike = Attraction.create(name: "Hollywood Sign Hike", city: la, price: 0.0, family_friendly: false)
#Boston
freedom = Attraction.create(name: "Freedom Trail", city: boston, price: 20.0, family_friendly: false)
sfne = Attraction.create(name: "Six Flags New England", city: boston, price: 60.0, family_friendly: true)
fenway = Attraction.create(name: "Fenway Park", city: boston, price: 25.0, family_friendly: false)
boston_bike = Attraction.create(name: "Urban Adventours", city: boston, price: 10.0, family_friendly: true)
#DC
wh = Attraction.create(name: "White House Tour", city: dc, price: 0.0, family_friendly: false)
kings = Attraction.create(name: "Kings Dominion", city: dc, price: 40.0, family_friendly: true)
fedex = Attraction.create(name: "Fedex Field Tour", city: dc, price: 25.0, family_friendly: false)
dc_bike = Attraction.create(name: "DC Monuments Bike Tour", city: dc, price: 10.0, family_friendly: true)

#Visits

#nyc

visit_1 = Visit.create(traveller: brad, attraction: sfga, date: DateTime.new(2017, 7, 15))
visit_2 = Visit.create(traveller: brad, attraction: statue, date: DateTime.new(2017, 7, 18))
visit_3 = Visit.create(traveller: david, attraction: yankee, date: DateTime.new(2017, 7, 15))
visit_4 = Visit.create(traveller: david, attraction: skating, date: DateTime.new(2017, 12, 15))
visit_5 = Visit.create(traveller: tashawn, attraction: statue, date: DateTime.new(2017, 7, 18))
visit_6 = Visit.create(traveller: tashawn, attraction: sfga, date: DateTime.new(2017, 7, 15))
visit_7 = Visit.create(traveller: zach, attraction: statue, date: DateTime.new(2017, 7, 18))
visit_8 = Visit.create(traveller: zach, attraction: yankee, date: DateTime.new(2017, 7, 30))

#miami

visit_9 = Visit.create(traveller: brad_pitt, attraction: jungle, date: DateTime.new(2017, 7, 15))
visit_10 = Visit.create(traveller: brad_pitt, attraction: church, date: DateTime.new(2017, 7, 18))
visit_11 = Visit.create(traveller: brad_pitt, attraction: hard_rock, date: DateTime.new(2017, 7, 18))
visit_12 = Visit.create(traveller: david, attraction: hard_rock, date: DateTime.new(2017, 7, 15))
visit_13 = Visit.create(traveller: david, attraction: dolphin_swim, date: DateTime.new(2017, 9, 15))
visit_14 = Visit.create(traveller: david_hasselhoff, attraction: dolphin_swim, date: DateTime.new(2017, 9, 15))
visit_15 = Visit.create(traveller: david_hasselhoff, attraction: hard_rock, date: DateTime.new(2017, 7, 15))

#los angeles

visit_16 = Visit.create(traveller: brad_pitt, attraction: hollywood_tour, date: DateTime.new(2017, 8, 15))
visit_17 = Visit.create(traveller: brad_pitt, attraction: dodger, date: DateTime.new(2017, 8, 18))
visit_18 = Visit.create(traveller: brad_pitt, attraction: hollywood_hike, date: DateTime.new(2017, 8, 18))
visit_19 = Visit.create(traveller: brad, attraction: hollywood_hike, date: DateTime.new(2017, 8, 15))
visit_20 = Visit.create(traveller: brad, attraction: disney, date: DateTime.new(2017, 8, 15))
visit_21 = Visit.create(traveller: david_hasselhoff, attraction: hollywood_hike, date: DateTime.new(2017, 8, 15))
visit_22 = Visit.create(traveller: david_hasselhoff, attraction: hollywood_tour, date: DateTime.new(2017, 8, 18))

#boston

visit_23 = Visit.create(traveller: brad, attraction: sfne, date: DateTime.new(2017, 10, 18))
visit_24 = Visit.create(traveller: brad, attraction: freedom, date: DateTime.new(2017, 10, 15))
visit_25 = Visit.create(traveller: david, attraction: fenway, date: DateTime.new(2017, 10, 18))
visit_26 = Visit.create(traveller: david, attraction: freedom, date: DateTime.new(2017, 10, 15))
visit_27 = Visit.create(traveller: david, attraction: boston_bike, date: DateTime.new(2017, 10, 17))

#dc

visit_28 = Visit.create(traveller: tashawn, attraction: wh, date: DateTime.new(2017, 10, 18))
visit_29 = Visit.create(traveller: tashawn, attraction: dc_bike, date: DateTime.new(2017, 10, 15))
visit_30 = Visit.create(traveller: zach, attraction: wh, date: DateTime.new(2017, 10, 18))
visit_31 = Visit.create(traveller: zach, attraction: kings, date: DateTime.new(2017, 10, 15))
visit_32 = Visit.create(traveller: zach, attraction: fedex, date: DateTime.new(2017, 10, 17))

# Reviews

#Brad

review_1 = Review.create(traveller: brad, attraction: sfga, rating: 5, message: "I love this place, awesome thrill rides!")
review_2 = Review.create(traveller: brad, attraction: statue, rating: 4, message: "Great experience!")
review_3 = Review.create(traveller: brad, attraction: hollywood_hike, rating: 5, message: "Great workout and awesome views!")
review_4 = Review.create(traveller: brad, attraction: disney, rating: 3, message: "Magical atmosphere, but the rides are not thrilling enough for my taste.")
review_5 = Review.create(traveller: brad, attraction: sfne, rating: 4, message: "Great time, but the rides are not as good as some other Six Flags parks.")
review_6 = Review.create(traveller: brad, attraction: freedom, rating: 2, message: "Boring tour guide, could have been more informative.")

#Brad Pitt

review_7 = Review.create(traveller: brad_pitt, attraction: jungle, rating: 2, message: "Only small children should come here.")
review_8 = Review.create(traveller: brad_pitt, attraction: church, rating: 1, message: "Got to stare at a building for a while.")
review_9 = Review.create(traveller: brad_pitt, attraction: hard_rock, rating: 4, message: "Go fins!")
review_10 = Review.create(traveller: brad_pitt, attraction: hollywood_tour, rating: 2, message: "They didn't talk about me enough.")
review_11 = Review.create(traveller: brad_pitt, attraction: dodger, rating: 4, message: "Great time, got to sit with Magic!")
review_12 = Review.create(traveller: brad_pitt, attraction: hollywood_hike, rating: 3, message: "Decent view of my house from here.")

#David

review_13 = Review.create(traveller: david, attraction: yankee, rating: 5, message: "Best hot dogs eve!")
review_14 = Review.create(traveller: david, attraction: skating, rating: 2, message: "My ass is killing me :(")
review_15 = Review.create(traveller: david, attraction: hard_rock, rating: 5, message: "Mecca of football!")
review_16 = Review.create(traveller: david, attraction: dolphin_swim, rating: 4, message: "Flipper rocks and I didn't drown.")
review_17 = Review.create(traveller: david, attraction: fenway, rating: 5, message: "Love this place, but where did I pahk my cah?!")
review_18 = Review.create(traveller: david, attraction: freedom, rating: 4, message: "Our tour guide was the man! So informative!")
review_19 = Review.create(traveller: david, attraction: boston_bike, rating: 2, message: "Got a flat tire during the ride, terrible experience.")

#David Hasselhoff

review_20 = Review.create(traveller: david_hasselhoff, attraction: dolphin_swim, rating: 5, message: "Reminded me of my Baywatch days!")
review_21 = Review.create(traveller: david_hasselhoff, attraction: hard_rock, rating: 5, message: "Everyone thought I was Dan Marino, it was a fun time!")
review_22 = Review.create(traveller: david_hasselhoff, attraction: hollywood_hike, rating: 3, message: "Way too much walking, wish I had Kit with me for this one.")
review_23 = Review.create(traveller: david_hasselhoff, attraction: hollywood_tour, rating: 1, message: "They didn't even know who I was, and didn't believe me when I said my name.")

#Tashawn

review_24 = Review.create(traveller: tashawn, attraction: statue, rating: 5, message: "Sweet!")
review_25 = Review.create(traveller: tashawn, attraction: sfga, rating: 3, message: "Only threw up twice all day.")
review_26 = Review.create(traveller: tashawn, attraction: wh, rating: 2, message: "They didn't mention Chester Arthur once...")
review_27 = Review.create(traveller: tashawn, attraction: dc_bike, rating: 4, message: "Best way to view all of the monuments!")

#Zach

review_28 = Review.create(traveller: zach, attraction: statue, rating: 2, message: "I'm afraid of heights!")
review_29 = Review.create(traveller: zach, attraction: yankee, rating: 3, message: "Cool tour, but the hot dogs weren't great.")
review_30 = Review.create(traveller: zach, attraction: wh, rating: 5, message: "Couldn't get enough of this place!")
review_31 = Review.create(traveller: zach, attraction: kings, rating: 3, message: "Fun rides, but I couldn't find any kettle corn.")
review_32 = Review.create(traveller: zach, attraction: fedex, rating: 4, message: "Pretty good tour, and good hot dogs!")
