# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Role.create(name: :admin)

user1 = User.create(username: 'Admin',
email: 'admin@gmail.com',
password: '1234',
password_confirmation:'1234'
)

user1.add_role(:admin)

Post.create(title:'hello',
body: 'welcome to the blog!',
user: user1
)

