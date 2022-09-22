class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
        flash[:notice] = "welcome to IMC Blog #{@user.username}, you have successfuly signed up"
        redirect_to articles_path
      
    else
       render 'new'
      end
    end

    private 
    def user_params
    params.require(:user).permit(:username, :email, :password)
    end
  

  # PATCH/PUT /users/1 or /users/1.json
  def update
   
  end

  # DELETE /users/1 or /users/1.json
  def destroy
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
    end
end
