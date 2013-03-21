
get '/comments/new' do
 @comment = Comment.new
 erb:'comments/new'
end

post '/posts/:id/comments/new' do
  if current_user
		@comment = Comment.new(body: params[:body], user_id: current_user.id, post_id: params[:id] )
		@comment.save
		@success = "You made a comment!"
    redirect("/posts/#{params[:id]}")
  else 
    redirect "/users/login"
  end  
end  
