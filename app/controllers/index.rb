get '/' do
  @posts = Post.paginate(page: params[:page], per_page: 30)
  erb :index
end
