class ReimbursementsController < ApplicationController
  before_action :set_reimbursement, only: %i[ show edit update destroy ]
    # GET /reimbursements or /reimbursements.json
    def index
      @reimbursements = Reimbursement.all
      render json: { reimbursements: @reimbursements }, status: :ok
    end
  
    # GET /reimbursements/1 or /reimbursements/1.json
    def show
      @reimbursement = Reimbursement.find(params[:id])
      render json: @reimbursement, status: :ok
    end

    def myReimbursements
      @reimbursements = Reimbursement.where(user_id: params[:id]).all
      render json: { reimbursements: @reimbursements }, status: :ok
    end

    
  
    # GET /reimbursements/new
    def new
      @reimbursement = Reimbursement.new
      @reimbursement.save
    end
  
    # GET /reimbursements/1/edit
    def edit
    end
  
    # POST /reimbursements or /reimbursements.json
    def create
      @reimbursement = Reimbursement.new(reimbursement_params)
      @reimbursement.save
    end
  
    # PATCH/PUT /reimbursements/1 or /reimbursements/1.json
    def update
      @reimbursement = Reimbursement.find(params[:id])
      @reimbursement.update(reimbursement_params)
      end

  
    # DELETE /reimbursements/1 or /reimbursements/1.json
    def destroy
      @reimbursement = Reimbursement.find(params[:id])
      @reimbursement.destroy
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
  