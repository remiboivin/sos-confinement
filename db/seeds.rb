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

doc1 = Doctor.create!(first_name: "Léon", last_name: "Martin", email: "leon@test.fr", password: "secret", specialty: "Psychologue", status: "confirmed", adeli_number: "1234", phone_number: "+33612789535")

doc2 = Doctor.create!(first_name: "Martine", last_name: "Lebon", email: "martine@test.fr", password: "secret", specialty: "Psychiatre", status: "confirmed", adeli_number: "5692", phone_number: "+33665572314")

doc3 = Doctor.create!(first_name: "Marie", last_name: "Laforêt", email: "marie@test.fr", password: "secret", specialty: "Coach", status: "confirmed", adeli_number: "1562", phone_number: "+33678356791")

doc4 = Doctor.create!(first_name: "Paul", last_name: "Busson", email: "paul@test.fr", password: "secret", specialty: "Sophrologue", status: "confirmed", adeli_number: "4875", phone_number: "+33651585337")


p "Creating Availabilities..."
## CREATE AVAILABILITIES ##

av1 = Availability.create!(doctor: doc1,
  status:"booked",
  date_start_year: 2020,
  date_start_month: 04,
  date_start_day: 30,
  time_start_hour: 8,
  time_start_minutes: 00,
  date_end_year: 2020,
  date_end_month: 04,
  date_end_day: 30,
  time_end_hour: 9,
  time_end_minutes: 00)

av2 = Availability.create!(doctor: doc1,
  status: "free",
  date_start_year: 2020,
  date_start_month: 04,
  date_start_day: 30,
  time_start_hour: 9,
  time_start_minutes: 00,
  date_end_year: 2020,
  date_end_month: 04,
  date_end_day: 30,
  time_end_hour: 10,
  time_end_minutes: 00)

av3 = Availability.create!(doctor: doc1,
  status: "free",
  date_start_year: 2020,
  date_start_month: 04,
  date_start_day: 30,
  time_start_hour: 10,
  time_start_minutes: 00,
  date_end_year: 2020,
  date_end_month: 04,
  date_end_day: 30,
  time_end_hour: 11,
  time_end_minutes: 00)

av4 = Availability.create!(doctor: doc1,
  status: "free",
  date_start_year: 2020,
  date_start_month: 04,
  date_start_day: 30,
  time_start_hour: 11,
  time_start_minutes: 00,
  date_end_year: 2020,
  date_end_month: 04,
  date_end_day: 30,
  time_end_hour: 12,
  time_end_minutes: 00)

av5 = Availability.create!(doctor: doc1,
  status: "free",
  date_start_year: 2020,
  date_start_month: 04,
  date_start_day: 30,
  time_start_hour: 14,
  time_start_minutes: 00,
  date_end_year: 2020,
  date_end_month: 04,
  date_end_day: 30,
  time_end_hour: 15,
  time_end_minutes: 00)

av6 = Availability.create!(doctor: doc1,
  status:"booked",
  date_start_year: 2020,
  date_start_month: 04,
  date_start_day: 30,
  time_start_hour: 16,
  time_start_minutes: 00,
  date_end_year: 2020,
  date_end_month: 04,
  date_end_day: 30,
  time_end_hour: 17,
  time_end_minutes: 00)

av7 = Availability.create!(doctor: doc2,  status: "free",
  date_start_year: 2020,
  date_start_month: 04,
  date_start_day: 30,
  time_start_hour: 11,
  time_start_minutes: 00,
  date_end_year: 2020,
  date_end_month: 04,
  date_end_day: 30,
  time_end_hour: 12,
  time_end_minutes: 00)

av8 = Availability.create!(doctor: doc2,  status:"booked",
  date_start_year: 2020,
  date_start_month: 04,
  date_start_day: 30,
  time_start_hour: 17,
  time_start_minutes: 00,
  date_end_year: 2020,
  date_end_month: 04,
  date_end_day: 30,
  time_end_hour: 18,
  time_end_minutes: 00)

av9 = Availability.create!(doctor: doc2,  status: "free",
  date_start_year: 2020,
  date_start_month: 04,
  date_start_day: 30,
  time_start_hour: 18,
  time_start_minutes: 00,
  date_end_year: 2020,
  date_end_month: 04,
  date_end_day: 30,
  time_end_hour: 19,
  time_end_minutes: 00)

av10 = Availability.create!(doctor: doc2,  status:"booked",
  date_start_year: 2020,
  date_start_month: 04,
  date_start_day: 30,
  time_start_hour: 19,
  time_start_minutes: 00,
  date_end_year: 2020,
  date_end_month: 04,
  date_end_day: 30,
  time_end_hour: 20,
  time_end_minutes: 00)

av11 = Availability.create!(doctor: doc2,  status: "free",
  date_start_year: 2020,
  date_start_month: 04,
  date_start_day: 30,
  time_start_hour: 15,
  time_start_minutes: 00,
  date_end_year: 2020,
  date_end_month: 04,
  date_end_day: 30,
  time_end_hour: 16,
  time_end_minutes: 00)

av12 = Availability.create!(doctor: doc2,  status: "free",
  date_start_year: 2020,
  date_start_month: 04,
  date_start_day: 30,
  time_start_hour: 16,
  time_start_minutes: 00,
  date_end_year: 2020,
  date_end_month: 04,
  date_end_day: 30,
  time_end_hour: 17,
  time_end_minutes: 00)

p "Creating Consultations..."
## CREATE CONSULTATIONS ##

cons1 = Consultation.create!(user: user1, availability: av1,status: "confirmed")

cons2 = Consultation.create!(user: user2, availability: av8, status: "pending")

cons3 = Consultation.create!(user: user1, availability: av6, status: "confirmed")

cons4 = Consultation.create!(user: user2, availability: av10, status: "declined")


p "Finished!"
