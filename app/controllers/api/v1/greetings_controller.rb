class Api::V1::GreetingsController < ApplicationController
  before_action :set_greeting, only: %i[ show update destroy ]

  # GET /api/v1/greetings
  def index
    @random_greeting = Greeting.order('RANDOM()').first
    render json: @random_greeting
  end

  # GET /api/v1/greetings/1
  def show
    render json: @greeting
  end

  # POST /api/v1/greetings
  def create
    @greeting = Greeting.new(greeting_params)

    if @greeting.save
      render json: @greeting, status: :created, location: @greeting
    else
      render json: @greeting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/greetings/1
  def update
    if @greeting.update(greeting_params)
      render json: @greeting
    else
      render json: @greeting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/greetings/1
  def destroy
    @greeting.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_greeting
      @greeting = Greeting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def greeting_params
      params.require(:greeting).permit(:message)
    end
end
