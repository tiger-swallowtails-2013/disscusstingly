helpers do

  #login/logout methods
  def find_user
    @user = User.find_by_email(@email)
  end

  def check_password
     give_token if @user.password == @password
  end

  def give_token
    session[:user_id] = @user.id
  end

  def login
    check_password unless find_user.nil?
  end

  def logout
    session[:user_id] = nil
  end

  def logged_in?
    session[:user_id].nil? ? false : true
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def authenticate
    redirect '/' unless logged_in?
  end

  #signup methods
  def signup
    u = User.new
    u.email = @email
    u.password = @password
    u.save
  end

end
