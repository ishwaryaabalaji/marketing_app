module ImportHelper
		 def log_in(user)
    session[:user_id] = user.id
    session[:email] = user.email
  end
   def current_user
    @current_user ||= User.where(id: session[:user_id]).first
    @current_user_email = @current_user.email
  end
   def logged_in?
    !current_user.nil?
  end
   def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
