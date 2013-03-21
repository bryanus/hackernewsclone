post '/:user/:post/postvotes/new' do 
  Post.find(params[:post]).postvotes.create(user_id: params[:user])
  redirect('/')
end
