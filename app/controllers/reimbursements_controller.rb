class ReimbursementsController < ApplicationController
  before_action :set_reimbursement, only: %i[ show edit update destroy ]
    # GET /reimbursements or /reimbursements.json
    def index
      @reimbursements = Reimbursement.all
      render json: { reimbursements: @reimbursements }, status: :ok
    end
  
    # GET /reimbursements/1 or /reimbursements/1.json
    def show
      @reimbursement = Reimbursement.where(id: params[:id], reimbursement_id: params[:reimbursement_id]).first
      render json: { reimbursements: @reimbursements }, status: :ok
    end

    def myReimbursements
      @reimbursements = Reimbursement.where(user_id: params[:id]).all
      render json: { reimbursements: @reimbursements }, status: :ok
    end

    
  
    # GET /reimbursements/new
    def new
      @reimbursement = Reimbursement.new
    end
  
    # GET /reimbursements/1/edit
    def edit
    end
  
    # POST /reimbursements or /reimbursements.json
    def create
      @user = User.new(reimbursement_params)

      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /reimbursements/1 or /reimbursements/1.json
    def update
      @reimbursement = Reimbursement.find(params[:id])

      if @reimbursement.update(reimbursement_params)
        redirect_to @reimbursement, notice: 'Reimbursement was successfully updated.'
      else
        render :edit
      end
      end

  
    # DELETE /reimbursements/1 or /reimbursements/1.json
    def destroy
      @reimbursement.destroy

      respond_to? do |format|
        format.html { redirect_to reimbursements_url, notice: "Reimbursement was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_reimbursement
        @reimbursement = Reimbursement.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def reimbursement_params
        params.require(:reimbursement).permit(:amount, :description, :status, :user_id)
      end
  end
  