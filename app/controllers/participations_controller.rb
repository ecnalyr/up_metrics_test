class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :update, :destroy]

  # GET /participations
  def index
    set_user

    if @user
      @participations = time_scoped_participations.where(user: @user)
    else
      @participations = time_scoped_participations
    end

    render json: @participations
  end

  # GET /participations/1
  def show
    render json: @participation
  end

  # POST /participations
  def create
    @participation = Participation.new(participation_params)

    if @participation.save
      render json: @participation, status: :created, location: @participation
    else
      render json: @participation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /participations/1
  def update
    if @participation.update(participation_params)
      render json: @participation
    else
      render json: @participation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /participations/1
  def destroy
    @participation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def participation_params
      params.require(:participation).permit(:date, :duration_minutes, :user_id, :sport_id)
    end

    # Set user from user member route
    def set_user
      if params[:id]
        @user = User.find(params[:id])
      end
    end

    def time_scoped_participations
      if request.fullpath.include?('/consumer')
        Participation.recent_participations
      else
        Participation.all
      end
    end
end
