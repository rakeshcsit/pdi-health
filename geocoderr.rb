require 'csv'
require 'geocoder'
require 'ipaddr'
require 'geokit'
#https://github.com/codeforamerica/ohana-api/wiki/Customizing-the-geocoding-configuration

#https://stackoverflow.com/questions/35244479/ruby-given-an-ip-address-find-out-the-city-and-state
#https://github.com/alexreisner/geocoder
#gem install geocoder

arr_of_arrs = CSV.read("leads.csv")

locations = []

arr_of_arrs.each do |a|
	ips = a.last
	# ip = IPAddr.new ips  
	# locations.push(Geocoder.address(ip.to_i))
	geo_ob = Geokit::Geocoders::MultiGeocoder.geocode(ips)
	locations.push([geo_ob.full_address])

	print(geo_ob.full_address)
	print("\n")
end

CSV.open("lead-locations.csv", "w") do |csv|
	locations.each do |l|
		csv << l
	end
end

#a = Geokit::Geocoders::MultiGeocoder.geocode("12.12.12.12")

# print(a.full_address)

# CSV.open("myfile.csv", "w") do |csv|
#   csv << ["row", "of", "CSV", "data"]
#   csv << ["another", "row"]
# end

# CSV.open("myfile2.csv", "w") do |csv|
#   csv << [2]
#   csv << [3]
# end