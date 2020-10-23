User.destroy_all
Logbook.destroy_all
Flight.destroy_all

u1=User.create :email => 'aviator@mail.com', :password => 'chicken', :first_name => "Avi", :last_name => "Ator"
puts "#{ User.count } users"

l1=Logbook.create :name => 'Powered', aviation_type: 'General Aviation'
l2=Logbook.create :name => 'Sailplane', aviation_type: 'Gliding'
l3=Logbook.create :name => 'Paragliding', aviation_type: 'Free Flight'
l4=Logbook.create :name => 'Meat Bomb', aviation_type: 'Skydiving'
puts "#{ Logbook.count } logbooks"

rand(100..400).times do
  vfr_time = rand(0.1..5.9).round(1)
  ifr_time = rand(0.1..5.9).round(1)
  aircraft_list = ['Cub', 'PC-9', 'Cherokee', 'Citabria', 'Archer', 'Bonanza', 'Airtruk', 'Seminole', 'DA-42', 'Duchess']
  aircraft_selector = rand(0..9)
  multi_status = false unless aircraft_selector >= 7
  f = Flight.create(
    :date => Faker::Date.between(from: '2019-06-20', to: '2020-10-21'),
    :aircraft => aircraft_list[aircraft_selector],
    :registration => "#{Faker::Alphanumeric.alpha(number: 2).upcase}-#{Faker::Alphanumeric.alpha(number: 3).upcase}",
    :night => Faker::Boolean.boolean(true_ratio: 0.3),
    :multi => multi_status,
    :command => Faker::Boolean.boolean(true_ratio: 0.8),
    :flight_time => vfr_time,
    :notes => Faker::Quote.most_interesting_man_in_the_world,
    :instrument_time => (ifr_time if ifr_time <= vfr_time  && rand() < 0.3)
  )
  l1.flights << f
end

rand(100..400).times do
  vfr_time = rand(0.1..5.9).round(1)
  ifr_time = rand(0.1..5.9).round(1)
  aircraft_list = ['Cirrus', 'Jantar', 'JS-1', 'Ventus', 'Arcus', 'Junior', 'Duo-Discus', 'Janus', 'DG-1000', 'ASK-21']
  aircraft_selector = rand(0..9)
  launch_type_list = ["Aerotow", "Winch"]
  command_status = true unless aircraft_selector >= 6
  f = Flight.create(
    :date => Faker::Date.between(from: '2019-06-20', to: '2020-10-21'),
    :aircraft => aircraft_list[aircraft_selector],
    :registration => "#{Faker::Alphanumeric.alpha(number: 2).upcase}-#{Faker::Alphanumeric.alpha(number: 3).upcase}",
    :command => command_status,
    :flight_time => vfr_time,
    :notes => Faker::Quote.most_interesting_man_in_the_world,
    :location => "Y#{Faker::Alphanumeric.alpha(number: 3).upcase}",
    :launch_type => launch_type_list[rand(0..1)]
  )
  l2.flights << f
end

rand(100..400).times do
  vfr_time = rand(0.1..5.9).round(1)
  ifr_time = rand(0.1..5.9).round(1)
  aircraft_list = ['Alpha 6', 'Koyot 3', 'Ikuma', 'Hook 5', 'Ascent 4', 'Sigma 11', 'Omega X-Alps 3', 'Pi 3',]
  launch_type_list = ["Aerotow", "Winch", "foot"]
  location_list = ["Mt Borah West", "Mt Borah East", "Mt Borah South", "Longreef", "Blackheath", "Stanwell Tops"]
  f = Flight.create(
    :date => Faker::Date.between(from: '2019-06-20', to: '2020-10-21'),
    :aircraft => aircraft_list[rand(0..7)],
    :flight_time => vfr_time,
    :notes => Faker::Quote.most_interesting_man_in_the_world,
    :location => location_list[rand(0..5)],
    :launch_type => launch_type_list[rand(0..2)],
    :distance => rand(0.1..494.19)
  )
  l3.flights << f
end

rand(100..400).times do |i|
  aircraft_list = ['Zulux', 'Solo', 'Pilot 7',]
  location_list =['Coffs City', 'Adrenalin Golburn', 'Skydive Elderslie', 'Sydney Skydivers Picton']
  altitude = rand(10000..18000)
  freefall_time = 10 + ((altitude - 1000) / 1000) * 5

  f = Flight.create(
    :date => Faker::Date.between(from: '2019-06-20', to: '2020-10-21'),
    :aircraft => aircraft_list[rand(0..2)],
    :serial => i + 1,
    :location => location_list[rand(0..3)],
    :notes => Faker::Quote.most_interesting_man_in_the_world,
    :launch_altitude => altitude,
    :freefall => freefall_time
  )
  l4.flights << f
end

puts "#{ Flight.count } Flights"

puts "Users and Logbooks"
u1.logbooks << l1 << l2 << l3 << l4
