# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Speciality.destroy_all
Occupation.destroy_all
array_city = ["Lenoratown", "Amparotown"," Wilburtown", "Rempelborough","Schultzville"]      
array_spec = ["Oncologist", "Radiologist", "Neurologist", "Pulmonologist", "Otolaryngologist", "Cardiologist", "Dermatologist"]
doctor = []
patient = []
array_city.length.times do |i|
array_city[i] = City.create(name: array_city[i])
end

20.times do |i|
	doctor[i] = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , zip_code: Faker::Address.zip_code, city_id: array_city[rand(5)].id)
end

array_spec.length.times do |i|
	array_spec[i] = Speciality.create(name: array_spec[i])
end

50.times do |i|
		occupation = Occupation.create!(speciality: array_spec[rand(7)], doctor: doctor[rand(20)])
			puts "mande oh #{i}"
end


100.times do |i|
	patient[i] = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: array_city[rand(5)].id)
end

200.times do |i|
  appointment = Appointment.create!(doctor: doctor[rand(20)], patient: patient[rand(100)],date: Faker::Time.forward(days: 28, period: :day), city_id: array_city[rand(5)].id)
  
end




