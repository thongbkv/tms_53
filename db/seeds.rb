# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create name: "Admin", email: "admin@framgia.com",
  password: "123456", role: :admin

User.create name: "Nguyen Binh Dieu", email: "nguyen.binh.dieu@framgia.com",
  password: "123456", role: :supervisor

User.create name: "Mai Tuan Viet", email: "mai.tuan.viet@framgia.com",
  password: "123456", role: :supervisor

User.create name: "Le Van Manh", email: "le.van.manh@framgia.com", 
  password: "123456", role: :trainee
  
User.create name: "Le Manh", email: "lemanh@framgia.com",
  password: "lemanh", role: :trainee

User.create name: "user", email: "user@framgia.com",
  password: "lemanh", role: :trainee
