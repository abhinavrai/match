class WelcomeController < ApplicationController
  def index
	if user_signed_in?
		if current_user.has_role?("admin")
			@users = User.joins(:group).where('groups.role' => 'user').paginate(:page => params[:page], :per_page => 5)
		else
			@quizzes = Quiz.paginate(:page => params[:page], :per_page => 5)
		end
	end
  end

  def destroy_user
	@user = User.find(params[:id])
	if @user.destroy
		redirect_to root_url, notice: 'User deleted successfully.'
	else
		redirect_to root_url, notice: 'User deletion failed.'
	end
  end
end
