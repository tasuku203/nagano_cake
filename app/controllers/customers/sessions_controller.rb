# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
 # before?_action :customer_state, only: [:create]
  
protected
#退会しているか判断するメソッド
#def customer_state
  #入力されたemailからアカウントを1件取得
  @customer = Customer.find_by(:email params[:customer][:email])
  #アカウントを取得できなかった場合このメソッドを終了する
  return if !@customer
  #取得したアカウントのパスワードと入力されたパスワードが一致しているかを判別
  if @customer.valid_password?(params[:customer][:password])
  end
end

def after_sign_out_path_for(resource)
  about_path
  #ほんとはroot_pathにしたいけどエラーが出るので取り合えす
end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
