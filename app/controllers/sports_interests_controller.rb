class SportsInterestsController < ApplicationController
  before_action :set_sports_interest, only: [:show, :update, :destroy]

  # GET /sports_interests
  def index
    set_user

    if @user
      @sports_interests = @user.sports_interests
    else
      @sports_interests = SportsInterest.all
    end

    render json: @sports_interests
  end

  # GET /sports_interests/1
  def show
    render json: @sports_interest
  end

  # POST /sports_interests
  def create
    @sports_interest = SportsInterest.new(sports_interest_params)

    if @sports_interest.save
      render json: @sports_interest, status: :created, location: @sports_interest
    else
      render json: @sports_interest.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sports_interests/1
  def destroy
    @sports_interest.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sports_interest
      @sports_interest = SportsInterest.find(params[:id])
    end

    # Set user from user member route
    def set_user
      if params[:id]
        @user = User.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def sports_interest_params
      params.require(:sports_interest).permit(:user_id, :sport_id)
    end
end
