class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
    # GET /users or /users.json
    def index
    @user = User.all
    render json: { user: @user }, status: :ok
    end
  
    # GET /users/1 or /users/1.json
    def show
      @user = User.where(id: params[:id], user_id: params[:user_id]).first
    end
  
    # GET /users/new
    def new
      @user = User.new
    end
  
    # GET /users/1/edit
    def edit
    end
  
    # POST /users or /users.json
  
  
    # def create
    #   @user = User.new(user_params)
    def create
      user = User.new(JSON.parse(request.body.read))
      if user.save
        render json: { user: user }, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

  
    # PATCH/PUT /users/1 or /users/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /users/1 or /users/1.json
    def destroy
      @user = User.find(params[:id])
      @user.destroy

    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:user_name, :password, :role, :email)
      end
  end
  