class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update]

  # GET /users or /users.json
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  # GET /users/1 or /users/1.json
  def show
  
   @articles = @user.articles.paginate(page: params[:page], per_page: 5)
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
        session[:user_id] = @user.id
        flash[:notice] = "welcome to IMC Blog #{@user.username}, you have successfuly signed up"
        redirect_to articles_path
      
    else
       render 'new'
      end
    end

     # PATCH/PUT /users/1 or /users/1.json
  def update
   
    if @user.update(user_params)
     flash[:notice] = "account successfully updated"
     redirect_to @user
    else
     render 'edit'
    end
   end

    private 
    def user_params
    params.require(:user).permit(:username, :email, :password)
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
