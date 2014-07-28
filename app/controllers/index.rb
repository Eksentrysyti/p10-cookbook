get '/' do
  # render home page
 #TODO: Show all users if user is signed in
 	@list = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
	erb :sign_in
end

post '/sessions' do
  # sign-in, create session
  @user = User.where(email: params[:email]).first
  if @user.password == params[:password]
  	session[:user_id] = @user.id
  end
  redirect '/'
end

delete '/sessions/:id' do
  # sign-out -- invoked
  session[:user_id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  # @user = User.new(name: params[:user][:name], email: params[:user][:email])
  @user = User.create(params[:user])
  @user.password = params[:user][:password]
  @user.save!

  redirect '/'
end