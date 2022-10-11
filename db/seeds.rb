# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

def prepare
   
    content = Faker::Lorem.sentence(word_count: 4)
    author = Faker::Name.name
    title= Faker::Movie.title
    rate = Faker::Number.between(from: 1, to: 5)
    user_id = Faker::Number.between(from: 1, to: 400)
    #id = Faker::Number.number(digits: 5)
    created_at = '2022-07-13 13:26:11.671'
    updated_at = '2022-07-13 13:26:11.671'
    {title: title, author: author, content: content, rate: rate, user_id: user_id, created_at: created_at, updated_at: updated_at}
end
def perparee
    name = Faker::Lorem.sentence(word_count: 4)
    email= Faker::Internet.email
    password_digest= Faker::Internet.password
    created_at = '2022-07-13 13:26:11.671'
    updated_at = '2022-07-13 13:26:11.671'
    #id = Faker::Number.number(digits: 5)
    ip= Faker::Internet.ip_v4_address
    {name: name, email: email, password_digest: password_digest, ip: ip, created_at: created_at, updated_at: updated_at}
end
#   def rate_post(post_instance)
#     title = Faker::Hipster.sentence(4)
#     body = Faker::Hipster.paragraph(2)
#     rate = Faker::Number.between(1,5)
#     new_post = post_instance.post.create(title: title, content: body, rate: rate)
#   end

require 'thread'

a = Thread.new {
    count=0
    500.times do
      post=Post.create(prepare)
    end
}

b = Thread.new {
    500.times do
       post=Post.create(prepare)
    end
}
c = Thread.new {
    500.times do
       post=Post.create(prepare)
   end
}

a.join
b.join
c.join


 100.times do 
  user= User.create(perparee)
 end

