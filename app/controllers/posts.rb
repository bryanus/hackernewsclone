

get '/posts/new' do
  if current_user
    @post = Post.new #for errors.
    erb :"/posts/new"
  else
    redirect "/users/login"
  end    
end

post '/posts/new' do 

  @post = Post.new(title: params[:title], url: params[:url], user_id: current_user.id)

  unless @post.save 
    erb :"/posts/new"
  else
    redirect ("/posts/#{@post.id}")
  end
end

get '/posts/:id' do 
  @post = Post.find(params[:id]) #params means coming from the url
  erb :"/posts/show"
end

