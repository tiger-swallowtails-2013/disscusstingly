require "faker"

10.times do
  user = User.create(lastname: Faker::Name.last_name, firstname: Faker::Name.first_name, email: Faker::Internet.email, password: Faker::Internet.password)
  3.times do
    topic = Topic.create(title: Faker::Company.catch_phrase, body: Faker::Lorem.paragraphs(paragraph_count = (rand(3)+1), supplemental = false).join('</br>'))
    5.times do
      comment = Comment.create(body: Faker::Lorem.paragraphs(paragraph_count = (rand(2)+1), supplemental = false).join('</br>'))
      #User.find_by_id(rand(User.all.size)+1).comments << comment
      user.topics << topic
      #user.comments << comment
      topic.comments << comment
    end
  end
end

Comment.all.each do |comment|
  User.find_by_id(rand(User.all.size)+1).comments << comment
end
