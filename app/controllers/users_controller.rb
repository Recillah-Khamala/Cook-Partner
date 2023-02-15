class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or users.json
  def index
    @users = User.all
  end

  #GET /users/user_id or users/user_id.json
  def show
  end

  # GET users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create 
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User successfully created.' }
        format.json {render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity}
        format.jso { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/user_id or users/user_id.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'user updated successfuly.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/user_id or users/user_id.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to user_url, notice: 'User destroyed successfully.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
