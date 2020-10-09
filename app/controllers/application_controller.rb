class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

    set :public_folder, 'public'
    # set :views, 'app/views'
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    set :session_secret, 'password_secure'


    def logged_in?
      !!session[:user_id]
    end

    def current_user
      
      @current_user ||= Organization.find(session[:user_id])
    end

end
