
get '/comments/new' do
 @comment = Comment.new
 erb:'comments/new'
end

post '/posts/:id/comments/new' do
  @comment = Comment.new(body: params[:body], user_id: current_user.id, post_id: params[:id] )

  unless @comment.save
    erb:"posts/show" 
  else
    @success = "You made a comment!"
    redirect("/posts/#{params[:id]}")
  end  
end  
