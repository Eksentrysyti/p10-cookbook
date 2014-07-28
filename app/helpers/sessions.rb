helpers do

  def current_user
  	if session[:user_id]
  		@current_user ||= User.where(id: session[:user_id]).first
  	end
  end

  def logged_in?
  	!current_user.nil?
  end

end
