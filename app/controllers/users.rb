get '/users/new' do

  erb:"users/new"
end  

post '/users/new' do

  @user = User.new(name: params[:name],
                   email: params[:email],
                    password: params[:password])
  unless @user.save
    erb:"/users/new"
  else
    login(@user)
    redirect ('/')
  end  

end  

get '/users/login' do
  erb:"/users/login"
end  


post '/users/login' do
  if User.authenticate(params[:email], params[:password])
    user = User.find_by_email(params[:email])
    login(user)
    redirect ('/')
  else
    redirect ("/users/login")
  end
end  

get '/users/logout' do
  session.clear
  # session[:token] = nil
  redirect ('/')
end  
