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
    redirect "/users/#{@user.id}"
  else
    redirect '/'
  end
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
  @user = User.create(params[:user])
  @user.password = params[:user][:password]
  @user.save!

  redirect "/users/#{@user.id}"
end

#--------- LOGGED IN ----------

get '/users/:id' do
  @user = User.find(params[:id].to_i)
  @ingredients = @user.ingredients
  erb :cookbook
end

#--------- INGREDIENTS --------

get '/ingredients' do
  user = User.find(params[:user_id])
  ingredients = user.ingredients
  ingredients.to_json
end

post '/ingredients' do
  user = User.find(params[:user_id])
  ingredient = Ingredient.new(name: params[:ingredient_name])
  user.ingredients << ingredient
  {ingredient_name: params[:ingredient_name], ingredient_id: ingredient.id}.to_json
end

delete '/ingredients' do
  ingredient = Ingredient.find(params[:ingredient_id])
  ingredient.destroy
  {ingredient_id: params[:ingredient_id]}.to_json
end

#--------- RECIPES ------------

get '/recipes' do
  user = User.find(params['user_id'].to_i)
  ingredients = user.ingredients
end