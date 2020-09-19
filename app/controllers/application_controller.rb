class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected
	def after_sign_in_path_for(resource)
	  case resource
	  when User
	    users_path
	    # ,flash[:notice]="登録が完了しました"
	  when Publisher
	    publishers_path
	  end
	end
end

# コメif文のようなもの