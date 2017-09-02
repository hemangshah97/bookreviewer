class SessionsController < ApplicationController
	skip_before_action :ensure_login, only: [:new, :create]
  def new
  	#login page - new.html.erb
  end

  def create
  	reviewer = 	Reviewer.find_by(name: params[:reviewer][:name])
  	password = params[:reviewer][:password]
  	if reviewer && reviewer.authenticate(password)
  		session[:reviewer_id] = reviewer.id
  		redirect_to root_path, notice:"Logged in Successfully."
  	else
  		redirect_to login_path, alert:"Invalid username/passowrd combination."
  	end
  end

  def destroy
  	reset_session
  	redirect_to login_path
  end
end
