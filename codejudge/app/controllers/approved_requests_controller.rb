class ApprovedRequestsController < ApplicationController
  before_action :set_approved_request, only: %i[ show edit update destroy ]

  # GET /approved_requests or /approved_requests.json
  def index
    #@approved_requests = ApprovedRequest.all
  end

  # GET /approved_requests/1 or /approved_requests/1.json
  def show
  end

  # GET /approved_requests/new
  def new
    @approved_request = ApprovedRequest.new
  end

  # GET /approved_requests/1/edit
  def edit
  end

  # POST /approved_requests or /approved_requests.json
  def create
    @approved_request = ApprovedRequest.new(approved_request_params)

    respond_to do |format|
      if @approved_request.save
        format.html { redirect_to approved_request_url(@approved_request), notice: "Approved request was successfully created." }
        format.json { render :show, status: :created, location: @approved_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @approved_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /approved_requests/1 or /approved_requests/1.json
  def update
    respond_to do |format|
      if @approved_request.update(approved_request_params)
        format.html { redirect_to approved_request_url(@approved_request), notice: "Approved request was successfully updated." }
        format.json { render :show, status: :ok, location: @approved_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @approved_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /approved_requests/1 or /approved_requests/1.json
  def destroy
    @approved_request.destroy

    respond_to do |format|
      format.html { redirect_to approved_requests_url, notice: "Approved request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approved_request
      @approved_request = ApprovedRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def approved_request_params
      params.fetch(:approved_request, {})
    end
end
