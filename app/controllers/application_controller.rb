class ApplicationController < ActionController::Base
  # deviseのactionが実行される前にconfigure_permitted_parematersを実行するよ
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end

  # privateだとこのcontroller内だけ、protectedだと他のcontrollerで呼び出されても参照される
  protected
  def configure_permitted_parameters
    # deviseのメソッド(authenticate_user!)を、コントローラが動作する前に実行する(before_action)
    # exceptは例外
    # ログインしていないユーザーはtop(新規登録かログインだけできる)に飛ばされる
    before_action :authenticate_user!,except: [:top]

    # ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
