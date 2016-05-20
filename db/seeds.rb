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

User.create name: "Naoko", email: "huyentrangto@yahoo.com",
  password: "123456", role: :trainee

User.create name: "Min", email: "huyentrang@yahoo.com",
  password: "123456", role: :trainee

User.create name: "user", email: "user@framgia.com",
  password: "lemanh", role: :trainee

UserCourse.create user_id: "4", course_id: "1"

UserCourse.create user_id: "5", course_id: "1"

Subject.create title: "Subject-1", description: "subject-1-description"

Subject.create title: "Subject-2", description: "subject-2-description"

Subject.create title: "ruby", description: "basic ruby"

Subject.create title: "ruby on rails", description: "ruby on rails"

Subject.create title: "git", description: "git"

Course.create name: "Course-1", description: "description - 1", user_id: 1
Course.create name: "Course-2", description: "description - 2", user_id: 2
