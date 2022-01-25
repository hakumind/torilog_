class UsersController < ApplicationController
  
  before_action :authenticate_user,{only:[:show,:edit,:update]}

  before_action :forbid_login_user,{only:[:new,:create,:login,:login_form]}

  def new
    @user =User.new
  end

  def create
    @user = User.new(name: params[:name],email: params[:email],image_name: "default_user.jpg",password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.image_name = "#{@user.id}.jpg"
    # 画像ファイルの名前を変更

    if image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
      # 画像データを元に画像ファイルを作成
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])

    if @user # @userが存在する時

      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/select")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]

      render("users/login_form")
    end

  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  
end
