# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user=User.create(email: "admin@admin.com", :password => "1234567a", :password_confirmation => "1234567a",rol: "admin")
user=User.create(email: "user@user.com", :password => "1234567a", :password_confirmation => "1234567a",rol: "user")