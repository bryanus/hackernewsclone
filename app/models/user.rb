class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :postvotes
  has_many :commentvotes


  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password) #need to make this a class method
    @user = User.find_by_email(email)
    @user && (Password.new(@user.password_hash) == password) #.password is the bcrypt method. The hashed password needs to be converted back into plaintext pw to be checked.
  end

end
