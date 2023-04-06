class ReimbursementsController < ApplicationController
  before_action :set_reimbursement, only: %i[ show edit update destroy ]
    # GET /reimbursements or /reimbursements.json
    def index
      @reimbursements = Reimbursement.all
    end
  
    # GET /reimbursements/1 or /reimbursements/1.json
    def show
      @user = User.where(id: params[:id], user_id: params[:user_id]).first
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
      @reimbursement = Reimbursement.new(reimbursement_params)
  
      respond_to do |format|
        if @reimbursement.save
          format.html { redirect_to reimbursement_url(@reimbursement), notice: "Reimbursement was successfully created." }
          format.json { render :show, status: :created, location: @reimbursement }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @reimbursement.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /reimbursements/1 or /reimbursements/1.json
    def update
      respond_to do |format|
        if @reimbursement.update(reimbursement_params)
          format.html { redirect_to reimbursement_url(@reimbursement), notice: "Reimbursement was successfully updated." }
          format.json { render :show, status: :ok, location: @reimbursement }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @reimbursement.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /reimbursements/1 or /reimbursements/1.json
    def destroy
      @reimbursement.destroy
  
      respond_to do |format|
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
  