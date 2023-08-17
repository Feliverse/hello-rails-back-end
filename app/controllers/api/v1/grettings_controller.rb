class Api::V1::GrettingsController < ApplicationController
  before_action :set_gretting, only: %i[ show update destroy ]

  # GET /api/v1/grettings
  def index
    @random_greeting = Greeting.order('RANDOM()').first
    render json: @random_greeting
  end

  # GET /api/v1/grettings/1
  def show
    render json: @gretting
  end

  # POST /api/v1/grettings
  def create
    @gretting = Gretting.new(gretting_params)

    if @gretting.save
      render json: @gretting, status: :created, location: @gretting
    else
      render json: @gretting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/grettings/1
  def update
    if @gretting.update(gretting_params)
      render json: @gretting
    else
      render json: @gretting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/grettings/1
  def destroy
    @gretting.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gretting
      @gretting = Gretting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gretting_params
      params.require(:gretting).permit(:message)
    end
end
