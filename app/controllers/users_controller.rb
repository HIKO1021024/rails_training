class UsersController < ApplicationController


skip_before_filter :verify_authenticity_token, only: [:create, :destroy]
# before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    user_admin?
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def my_data_show
  end
  
  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to(sessions_new_path, flash: { success: "ユーザーを作成しました。認証メールを確認し、有効化してください" }) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to(users_url,flash: { success: "ユーザー#{@user.name}を削除しました"}) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:image, :name, :email, :password, :password_confirmation)
    end
end
