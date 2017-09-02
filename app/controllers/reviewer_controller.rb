class ReviewerController < ApplicationController
	skip_before_action :ensure_login, only: [:new, :create]
  	def new
  		@reviewer=Reviewer.new
  	end

	  def create
	  	  @reviewer=Reviewer.new(reviewer_params)
	  	if @reviewer.save
	  		redirect_to login_path, notice: "Registered successfully"
	  	else
	  		redirect_to sign_up_new_path, alert: "Unsuccessful. Try again"
	  	end
	  end
	    private
	  		def reviewer_params
				params.require(:reviewer).permit(:name, :password)
			end
end
