User.destroy_all
u1=User.create :email => 'amelia@mail.com', :password => 'chicken'
u2=User.create :email => 'doug@mail.com', :password => 'chicken'
u3=User.create :email => 'ingo@mail.com', :password => 'chicken'
u4=User.create :email => 'aviator@mail.com', :password => 'chicken'
puts "#{ User.count } users"

Logbook.destroy_all
l1=Logbook.create :name => 'RAF', aviation_type: 'General Aviation'
l2=Logbook.create :name => 'Shell', aviation_type: 'General Aviation'
l3=Logbook.create :name => 'Local', aviation_type: 'General Aviation'
l4=Logbook.create :name => 'Gliding', aviation_type: 'Gliding'
l5=Logbook.create :name => 'Powered', aviation_type: 'General Aviation'
l6=Logbook.create :name => 'Sailplane', aviation_type: 'Gliding'
l7=Logbook.create :name => 'Paragliding', aviation_type: 'Free Flight'
l8=Logbook.create :name => 'Meat Bomb', aviation_type: 'Skydiving'
puts "#{ Logbook.count } logbooks"

Flight.destroy_all
f1=Flight.create :date => '1941-06-21', :aircraft => 'Spitfire Va', :registration => 'W3185', :night => false, :multi => false, :command => true, :flight_time => 1.8, :notes => "One Bf 109 shot down near Desvres"
f2=Flight.create :date => '1941-08-09', :aircraft => 'Spitfire Va', :registration => 'W3185', :night => false, :multi => false, :command => true, :flight_time => 1.1, :notes => "Collided with Bf 109, bailed out near Blaringhem"

f3=Flight.create :date => '1945-5-12', :aircraft => 'Percival Proctor', :registration => 'G-BADR', :night => true, :multi => false, :command => true, :flight_time => 2.4, :notes => "Publicity over Nice"
f4=Flight.create :date => '1946-9-20', :aircraft => 'Miles Gemini', :registration => 'W3185', :night => false, :multi => true, :command => true, :flight_time => 0.4, :notes => "Near Athens with James Doolittle"

f5=Flight.create :date => '1920-12-28', :aircraft => 'Standard J-1',  :night => false, :multi => false, :command => false, :flight_time => 0.1, :notes => "First flight at Long Beach!"
f6=Flight.create :date => '1922-10-22', :aircraft => 'Kinner Airster',  :night => false, :multi => false, :command => true, :flight_time => 1.4, :notes => "Flew to 14,000ft. Highest woman in history!"

f7=Flight.create :date => '1982-12-14', :aircraft => 'Nimbus 3', :registration => 'VH-IVE', :night => false, :multi => false, :command => true, :flight_time => 1.1, :notes => "Set record of 100km triangle at 195.3km/h.", :location => 'YNRM', :launch_type => 'Aerotow'
f8=Flight.create :date => '1982-9-30', :aircraft => 'Nimbus 3', :registration => 'VH-IVE', :night => false, :multi => false, :command => true, :flight_time => 6.5, :notes => "1095.05km straight line. Australian record.", :location => 'YBTH', :launch_type => 'Aerotow'

f9=Flight.create :date => '2020-6-15', :aircraft => '7GCBC', :registration => 'VH-RRW', :night => false, :multi => false, :command => true, :flight_time => 1.5, :notes => "Practice aeros- loop, stall turn. Circuits"
f10=Flight.create :date => '2020-7-30', :aircraft => '7GCBC', :registration => 'VH-VMS', :night => false, :multi => false, :command => false, :flight_time => 1.1, :notes => "Spin training, precision exit, xwind ccts."

f11=Flight.create :date => '2020-8-15', :aircraft => 'Junior', :registration => 'VH-HDP', :command => true, :flight_time => 2.0, :notes => "Thermalling local flight", :location => 'YBTH', :launch_type => 'Aerotow'
f12=Flight.create :date => '2020-8-21', :aircraft => 'Junior', :registration => 'VH-HDP', :command => true, :flight_time => 0.3, :notes => "Scratched and had to land. Overcast day", :location => 'YBTH', :launch_type => 'Aerotow'

f13=Flight.create :date => '2020-09-10', :aircraft => 'Alpha 6', :night => false, :multi => false, :command => true, :flight_time => 0.1, :notes => "Sledder", :location => 'Manilla South', :launch_type => 'foot', :distance => 0.1
f14=Flight.create :date => '2020-09-13', :aircraft => 'Alpha 6', :flight_time => 2.5, :notes => "Ridge soaring off launch, went over the back and landed at HQ", :location => 'Manilla South', :launch_type => 'foot', :distance => 0.4

f15=Flight.create :date => '2020-10-03', :aircraft => 'Sabre 2',  :notes => "Work on landing technique", :location => 'Sydney Skydivers', :serial => 1, :freefall => 60, :launch_altitude => 14000
f16=Flight.create :date => '2020-10-04', :aircraft => 'Sabre 2',  :notes => "Better landing", :location => 'Sydney Skydivers', :serial => 2, :freefall => 60, :launch_altitude => 14000
puts "#{ Flight.count } Flights"

puts "Users and Logbooks"
u1.logbooks << l3
u2.logbooks << l1 << l2
u3.logbooks << l4
u4.logbooks << l5 << l6 << l7 << l8

puts "Logbooks and Flights"
l1.flights << f1 << f2
l2.flights << f3 << f4
l3.flights << f5 << f6
l4.flights << f7 << f8
l5.flights << f9 << f10
l6.flights << f11 << f12
l7.flights << f13 << f14
l8.flights << f15 << f16

#TODO Add ID of owner to belongs_to tables
