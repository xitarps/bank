# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts '===================Criando dados==================='
unless Root.any?
  print 'criando root...'
  Root.create(user_attributes: { email: 'root@root.com', password: 123456 } )
  ActiveRecord::Base.connection.execute("UPDATE users SET confirmed_at = NOW() where users.userable_type = 'Root'")
  puts 'OK!'
end

unless Customer.any?
  print 'criando customer...'
  customer = FactoryBot.create(:user, :confirmed, email: 'customer@customer.com', password: '123456').userable
  other_customer = FactoryBot.create(:user, :confirmed, email: 'other_customer@customer.com', password: '123456').userable
  another_customer = FactoryBot.create(:user, :confirmed, email: 'another_customer@customer.com', password: '123456').userable
  puts 'OK!'
end

if customer&.contact_list&.customers&.empty?
  print 'criando lista de contatos de customer...'
  customer.contact_list.customers << other_customer
  customer.contact_list.customers << another_customer
  puts 'OK!'
end

unless Administrator.any?
  print 'criando administrador...'
  FactoryBot.create(:user, :confirmed, :administrator, email: 'administrator@administrator.com', password: '123456').userable
  puts 'OK!'
end

unless Tax.any?
  print 'criando taxas...'
  FactoryBot.create(:tax)
  FactoryBot.create(:tax)
  FactoryBot.create(:tax)
  puts 'OK!'
end

unless Product.any?
  print 'criando produtos...'
  FactoryBot.create(:product)
  FactoryBot.create(:product)
  FactoryBot.create(:product)
  puts 'OK!'
end

unless Classroom.any?
  print 'criando turmas...'
  FactoryBot.create(:classroom)
  Classroom.first.customers << Customer.second
  Classroom.first.customers << Customer.third
  puts 'OK!'
end

puts '============Criação de dados finalizada============'