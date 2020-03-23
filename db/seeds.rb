suser = User.create(email: "admin@sos-confinement.fr", password: "opsone")
Role.find_or_create_by(id: 1, name: "admin")
Role.find_or_create_by(id: 2, name: "manager")
Role.find_or_create_by(id: 3, name: "member")
Role.find_or_create_by(id: 4, name: "moderator")
user.add_role "admin"
# mot de passe sosconfinement
# 2020Mlgswdfb.
