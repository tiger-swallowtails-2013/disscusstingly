helpers do

  #login/logout methods
  def find_user
    @user = User.find_by_email(params[:email])
  end

  def authenticate
     give_token if @user.password == params[:password]
  end

  def give_token
    session[:user_id] = @user.id
  end

  def login
    authenticate unless find_user.nil?
  end

  def logout
    session[:user_id] = nil
  end

  def logged_in?
    session[:user_id].nil? ? false : true
  end

  #signup methods
  def signup
    u = User.new
    u.email = params[:email]
    u.password = params[:password]
    u.save
  end

end
