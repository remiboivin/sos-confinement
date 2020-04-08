# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Cleaning DB"

Volunteer.delete_all
Planning.delete_all

p "Creating seeds"


## VOLUNTEERS ##
vol1 = Volunteer.create!(name: "Caroline", first_name: "Douet", email: "caro@test.fr", password: "secret", specialty: "Coach", comment: "Lorem")

vol2 = Volunteer.create!(name: "Martine", first_name: "Laforêt", email: "martine@test.fr", password: "secret", specialty: "Prof", comment: "Lorem")

vol3 = Volunteer.create!(name: "Jean", first_name: "Durand", email: "jean@test.fr", password: "secret", specialty:"Commercial", comment: "Lorem")


## PLANNING ##

p1 = Planning.create!(volunteer: vol1, date_start: DateTime.new(2020,4,30,8,00).to_date, date_end: DateTime.new(2020,4,30,9,00).to_date, time_start: DateTime.new(2020,4,30,8,00).to_time, time_end: DateTime.new(2020,4,30,9,00).to_time)

p2 = Planning.create!(volunteer: vol1, date_start: DateTime.new(2020,4,30,9,00).to_date, date_end: DateTime.new(2020,4,30,10,00).to_date, time_start: DateTime.new(2020,4,30,9,00).to_time, time_end: DateTime.new(2020,4,30,10,00).to_time)

p3 = Planning.create!(volunteer: vol1, date_start: DateTime.new(2020,4,30,10,00).to_date, date_end: DateTime.new(2020,4,30,11,00).to_date, time_start: DateTime.new(2020,4,30,10,00).to_time, time_end: DateTime.new(2020,4,30,11,00).to_time)

p4 = Planning.create!(volunteer: vol1, date_start: DateTime.new(2020,4,30,11,00).to_date, date_end: DateTime.new(2020,4,30,12,00).to_date, time_start: DateTime.new(2020,4,30,11,00).to_time, time_end: DateTime.new(2020,4,30,12,00).to_time)

p5 = Planning.create!(volunteer: vol2, date_start: DateTime.new(2020,4,30,11,00).to_date, date_end: DateTime.new(2020,4,30,12,00).to_date, time_start: DateTime.new(2020,4,30,11,00).to_time, time_end: DateTime.new(2020,4,30,12,00).to_time)

p6 = Planning.create!(volunteer: vol2, date_start: DateTime.new(2020,4,30,13,00).to_date, date_end: DateTime.new(2020,4,30,14,00).to_date, time_start: DateTime.new(2020,4,30,13,00).to_time, time_end: DateTime.new(2020,4,30,14,00).to_time)

p6 = Planning.create!(volunteer: vol2, date_start: DateTime.new(2020,4,30,14,00).to_date, date_end: DateTime.new(2020,4,30,15,00).to_date, time_start: DateTime.new(2020,4,30,14,00).to_time, time_end: DateTime.new(2020,4,30,15,00).to_time)

p6 = Planning.create!(volunteer: vol2, date_start: DateTime.new(2020,4,30,15,00).to_date, date_end: DateTime.new(2020,4,30,16,00).to_date, time_start: DateTime.new(2020,4,30,15,00).to_time, time_end: DateTime.new(2020,4,30,16,00).to_time)

p "Finished!"
