# suser = User.create(email: "admin@sos-confinement.fr", password: "opsone")
# Role.find_or_create_by(id: 1, name: "admin")
# Role.find_or_create_by(id: 2, name: "manager")
# Role.find_or_create_by(id: 3, name: "member")
# Role.find_or_create_by(id: 4, name: "moderator")
# user.add_role "admin"
# mot de passe sosconfinement
# 2020Mlgswdfb.

p "Cleaning DB..."
Doctor.destroy_all
Patient.destroy_all
User.destroy_all
Alert.destroy_all

p "Creating seeds..."

## CREATE DOCTORS ##

doc1 = Doctor.create!(email: "leon@test.fr" , password: "secret" , name: "Dupont" , first_name: "Leon" , adeli: "DJE2653", speciality: "psychiatre", is_valid: true)
doc2 = Doctor.create!(email: "martine@test.fr" , password: "secret" , name: "Laforêt" , first_name: "Martine" , adeli: "GDL0123", speciality: "psychologue", is_valid: true)
doc3 = Doctor.create!(email: "karine@test.fr" , password: "secret" , name: "Martin" , first_name: "Karine" , adeli: "LEO4569", speciality: "pair-aidant", is_valid: false)
## CREATE PATIENTS ##

pat1 = Patient.create!(email: "paul@test.fr" , name: "Lebon" , first_name: "Paul" , phone: "+33636758932")
pat2 = Patient.create!(email: "carole@test.fr" , name: "Montagne" , first_name: "Carole" , phone: "0678963125")
pat3 = Patient.create!(email: "thomas@test.fr" , name: "Petit" , first_name: "Thomas" , phone: "0240493647")

## CREATE USERS ##

user1 = User.create!(email: "admin@sos-confinement.fr" , password: "secret" , last_name: "Panchaud" , first_name: "Stephane" , is_admin: true)
user2 = User.create!(email: "jb@sos-confinement.fr" , password: "secret" , last_name: "Goupil" , first_name: "Jean-Baptise" , is_admin: true)


## CREATE ALERTS ##

al1 = Alert.create!(patient: pat1, doctor: doc1, comment: "", is_booked: true)

al2 = Alert.create!(patient: pat2, doctor: doc2, comment: "", is_booked: true)

al2 = Alert.create!(patient: pat3, doctor: doc3, comment: "", is_booked: false)

p "Finished!"
