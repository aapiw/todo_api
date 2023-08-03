class PlansController < ApplicationController
  before_action :set_plan, only: %i[ show update destroy ]

  # GET /plans
  def index
    @plans = Plan.all
    @plans = @plans.where(is_completed: eval(params[:is_completed]) ) if params[:is_completed].present? && params[:is_completed] == "true"
    render json: @plans
  end

  # GET /plans/1
  def show
    render json: @plan
  end

  # POST /plans
  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      render json: Plan.all, status: :created, location: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plans/1
  def update
    if @plan.update(plan_params)
      render json: Plan.all
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plans/1
  def destroy
    @plan.destroy
    render json: Plan.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plan_params
      params.require(:plan).permit(:text, :is_completed)
    end
end
