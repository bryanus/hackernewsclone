

get '/posts/new' do
  @post = Post.new #for errors.
  erb :"/posts/new"
end

post '/posts/new' do 

  @post = Post.new(title: params[:title], url: params[:url], user_id: current_user.id)

  unless @post.save 
    erb :"posts/new"
  else
    redirect ("/posts/#{@post.id}")
  end
end

get '/posts/:id' do 
  @post = Post.find(params[:id])
  erb :"posts/show"
end

