class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
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

    def destroy
      @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:notice] = "Account and all associated articls successfully deleted"
      redirect_to articles_path
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

    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own account"
        redirect_to @user
      end
    end
end
