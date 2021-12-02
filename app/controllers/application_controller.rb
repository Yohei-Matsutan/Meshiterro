class ApplicationController < ActionController::Base
  # deviseのactionが実行される前にconfigure_permitted_parematersを実行するよ
  before_action :configure_permitted_parameters, if: :devise_controller?

  # privateだとこのcontroller内だけ、protectedだと他のcontrollerで呼び出されても参照される
  protected
  def configure_permitted_parameters
    # ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
