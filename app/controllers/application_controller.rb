class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      # usernameを追加
      added_attrs = [:email, :username, :password, :password_confirmation]
      
      # サインアップ時にusernameを許可
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      
      # アカウント更新時にusernameを許可
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      
      # サインイン時にusernameを許可
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end