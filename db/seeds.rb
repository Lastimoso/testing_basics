# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

admin =  User.create!(
  first_name: 'Gerard',
  last_name: 'Raiden',
  email: 'gerardo@boxful.io',
  password: '123456',
  admin: true
)

5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456'
  )
end
users = User.all
users.each do |user|
  user.projects.build.tap do |project|
    project.name = Faker::Music.genre
    project.description = Faker::Lorem.paragraph
    project.due_date = Faker::Date.forward(days: 30)
    (10..20).to_a.sample.times do
      project.tasks.build.tap do |task|
        task.content = Faker::Verb.base + ' ' + Faker::Music.band
        if Faker::Number.within(range: 1..10).odd?
          task.fulfilled_at = Faker::Time.backward(days: 15, period: :evening)
          task.user = users.sample
        end
      end
    end
  end
end
puts "done!"