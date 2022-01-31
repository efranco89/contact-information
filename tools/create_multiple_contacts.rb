# 10000.times do
#   contact = Contact.new
#   contact.name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
#   contact.birthday = rand(DateTime.now.years_ago(50)..DateTime.now.years_ago(19)).strftime("%Y/%m/%d")
#   contact.phone = "(+57) #{rand(200..900)} #{rand(200..900)} #{rand(10..99)} #{rand(10..99)}"
#   contact.address = Faker::Address.street_address
#   contact.credit_card = "4#{rand(10 ** 15)}"
#   contact.email = Faker::Internet.email
#   contact.user_id = User.last.id
#   contact.save
# end

puts "Name,Birthday,phone,address,card,email"
1000.times do
  x = rand(1..10)
  if x >= 3 && x < 4
    puts "#{Faker::Name.first_name} #{Faker::Name.last_name},#{rand(DateTime.now.years_ago(50)..DateTime.now.years_ago(19)).strftime("%Y/%m/%d")},(+57) #{rand(200..900)} #{rand(200..900)} #{rand(10..99)} #{rand(10..99)},4#{rand(10 ** 15)},#{Faker::Address.street_address},#{Faker::Internet.email}"
  elsif x>=4 && x<=9
    puts "#{Faker::Name.first_name} #{Faker::Name.last_name},#{rand(DateTime.now.years_ago(50)..DateTime.now.years_ago(19)).strftime("%Y/%m/%d")},(+57) #{rand(200..900)} #{rand(200..900)} #{rand(10..99)} #{rand(10..99)},55#{rand(10 ** 14)},#{Faker::Address.street_address},#{Faker::Internet.email}"
  else
    puts "#{Faker::Name.first_name} #{Faker::Name.last_name},#{rand(DateTime.now.years_ago(50)..DateTime.now.years_ago(19)).strftime("%Y/%m/%d")},(+57) #{rand(200..900)} #{rand(200..900)} #{rand(10..99)} #{rand(10..99)},1#{rand(10 ** 15)},#{Faker::Address.street_address},#{Faker::Internet.email}"
  end
end
