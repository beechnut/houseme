module SessionsHelper

  def sign_in(user)
    # Visit for non-permanent cookies
    # http://ruby.railstutorial.org/book/ruby-on-rails-tutorial#code-sign_in_function
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user # sets current_user as sign_in-passed user
    # what happens if we write @c_u instead of self.c_u
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    # Since it's stateless, will the || ever not evaluate to the User...part?
    # maybe if we have current_user.### in multiple places?
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil? # this calls current_user
    # so if this and a view both do it, then the || helps
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
