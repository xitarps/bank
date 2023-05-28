# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'criando root'
unless Root.any?
  Root.create(user_attributes: { email: 'root@root.com', password: 123456 } )
  ActiveRecord::Base.connection.execute("UPDATE users SET confirmed_at = NOW() where users.userable_type = 'Root'")
end
puts 'root criado'