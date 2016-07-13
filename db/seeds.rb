# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

case Rails.env
when "development"
  user = User.new(email: "user@my-stream.io", password: "password")
  user.save
end
