class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]

  # GET /teams
  def index
    set_associated_object

    if @associated_object
      @teams = @associated_object.teams
    else
      @teams = Team.all
    end

    render json: @teams
  end

  # GET /teams/1
  def show
    render json: @team
  end

  # POST /teams
  def create
    @team = Team.new(team_params)

    if @team.save
      render json: @team, status: :created, location: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Set user from user member route
    def set_associated_object
      if params[:id]
        @associated_object = associated_class_derived_from_path.find(params[:id])
      end
    end

    def associated_class_derived_from_path
      # This is silly and prone to problems, but works for our tested scenarios
      if request.fullpath.include?('/user')
        User
      else
        Organization
      end
    end

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:team).permit(:name, :organization_id)
    end
end
