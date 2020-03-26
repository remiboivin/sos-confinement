# suser = User.create(email: "admin@sos-confinement.fr", password: "opsone")
# Role.find_or_create_by(id: 1, name: "admin")
# Role.find_or_create_by(id: 2, name: "manager")
# Role.find_or_create_by(id: 3, name: "member")
# Role.find_or_create_by(id: 4, name: "moderator")
# user.add_role "admin"
# # mot de passe sosconfinement
# # 2020Mlgswdfb.


p "Cleaning DB"
Availability.destroy_all
Consultation.destroy_all
User.destroy_all
Doctor.destroy_all

p "Creating Users..."
## CREATE USERS ##

user1 = User.create!(first_name: "Caroline", last_name: "Douet", email: "caro@test.fr", password: "secret")

user2 = User.create!(first_name: "Jean", last_name: "Dupont", email: "jean@test.fr", password: "secret")


p "Creating Doctors..."
## CREATE DOCTORS ##

doc1 = Doctor.create!(first_name: "Léon", last_name: "Martin", email: "leon@test.fr", password: "secret", specialty: "Psychologue")

doc2 = Doctor.create!(first_name: "Martine", last_name: "Lebon", email: "martine@test.fr", password: "secret", specialty: "Psychiatre")

doc3 = Doctor.create!(first_name: "Marie", last_name: "Laforêt", email: "marie@test.fr", password: "secret", specialty: "Coach")

doc4 = Doctor.create!(first_name: "Paul", last_name: "Busson", email: "paul@test.fr", password: "secret", specialty: "Sophrologue")


p "Creating Availabilities..."
## CREATE AVAILABILITIES ##

av1 = Availability.create!(doctor: doc1, datetime_start: DateTime.new(2020, 03, 30, 8, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 9, 00, 0))

av2 = Availability.create!(doctor: doc1, datetime_start: DateTime.new(2020, 03, 30, 9, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 10, 00, 0))

av3 = Availability.create!(doctor: doc1, datetime_start: DateTime.new(2020, 03, 30, 10, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 11, 00, 0))

av4 = Availability.create!(doctor: doc1, datetime_start: DateTime.new(2020, 03, 30, 11, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 12, 00, 0))

av5 = Availability.create!(doctor: doc1, datetime_start: DateTime.new(2020, 03, 30, 14, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 15, 00, 0))

av6 = Availability.create!(doctor: doc1, datetime_start: DateTime.new(2020, 03, 30, 15, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 16, 00, 0))

av7 = Availability.create!(doctor: doc2, datetime_start: DateTime.new(2020, 03, 30, 8, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 9, 00, 0))

av8 = Availability.create!(doctor: doc2, datetime_start: DateTime.new(2020, 03, 30, 9, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 10, 00, 0))

av9 = Availability.create!(doctor: doc2, datetime_start: DateTime.new(2020, 03, 30, 10, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 11, 00, 0))

av10 = Availability.create!(doctor: doc2, datetime_start: DateTime.new(2020, 03, 30, 16, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 17, 00, 0))

av11 = Availability.create!(doctor: doc2, datetime_start: DateTime.new(2020, 03, 30, 17, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 18, 00, 0))

av12 = Availability.create!(doctor: doc2, datetime_start: DateTime.new(2020, 03, 30, 18, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 19, 00, 0))

p "Creating Consultations..."
## CREATE CONSULTATIONS ##

cons1 = Consultation.create!(user: user1, doctor: doc1, datetime_start: DateTime.new(2020, 03, 30, 8, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 9, 00, 0))

cons2 = Consultation.create!(user: user2, doctor: doc2, datetime_start: DateTime.new(2020, 03, 30, 16, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 17, 00, 0))

cons3 = Consultation.create!(user: user1, doctor: doc2, datetime_start: DateTime.new(2020, 03, 30, 18, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 19, 00, 0))

cons4 = Consultation.create!(user: user2, doctor: doc1, datetime_start: DateTime.new(2020, 03, 30, 10, 00, 0), datetime_end: DateTime.new(2020, 03, 30, 11, 00, 0))


p "Finished!"
