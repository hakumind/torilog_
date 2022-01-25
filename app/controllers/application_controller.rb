class ApplicationController < ActionController::Base
  
    before_action :set_current_user

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    #ログインしてない時のアクセス制限
    def authenticate_user
        if @current_user == nil 
          flash[:notice] = "ログインが必要です"
          redirect_to("/login")
        end
        
        if @current_user != nil 
          #ログインしている状態で、@current_user.idの値がある時

          if @current_user.id.to_i != params[:id].to_i
            #値の比較は整数に直してから
  
            # flash[:notice] = "セッション値：#{@current_user.id}パラムス値：#{params[:id]}"
            flash[:notice] = "他のユーザーへのアクセスはできません"
            # redirect_to("/login") => すでにログイン済の状態から、ログイン画面に遷移しようとするので、下にあるログインユーザーのアクセス制限に引っかかってしまう
            redirect_to("/users/#{@current_user.id}")
          end
        end
        
    end

    #ログインユーザーのアクセス制限
    def forbid_login_user
        if @current_user 
          flash[:notice] = "すでにログインしています"
          redirect_to("/posts/select")
        end
     end
end
