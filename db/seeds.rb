
5.times do
  u = User.create(name: Faker::Name.name, email: Faker::Internet.email, password_hash: 'password')
  10.times do 
  Post.create(title: Faker::Lorem.sentence, url: Faker::Internet.url, user_id: u.id)
  end
end

User.all.each do |u|
  Post.all.each do |p|
    p.comments.create(body: Faker::Lorem.paragraph, user_id: u.id )
    p.postvotes.create(user_id: u.id)
  end
  Comment.all.each do |c|
    c.commentvotes.create(user_id: u.id) 
  end 
end

# Comment.create(post_id: post.id), equivalent to line 12
# watch out for name conflicts
