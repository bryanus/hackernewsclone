post '/:user/:comment/commentvotes/new' do
  comment = Comment.find(params[:comment])
  comment.commentvotes.create(user_id: params[:user])
  redirect "posts/#{comment.post.id}"
end  
