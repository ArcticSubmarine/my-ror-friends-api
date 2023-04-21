class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show update destroy ]

  # GET /friends
  def index
    @friends = Friend.all

    render json: @friends
  end

  # GET /friends/1
  def show
    render json: @friend
  end

  # POST /friends
  def create
    @friend = Friend.create(first_name: friend_params['first_name'], last_name: friend_params['last_name'], birthdate: friend_params['birthdate'])
    # @friend.houses = friend_params['houses'].map do |house|
    #   House.new(house)
    # end

    if @friend.save
      render json: @friend, status: :created, location: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /friends/1
  def update
    if @friend.update(friend_params)
      render json: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friends/1
  def destroy
    @friend.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

  def set_houses
    @houses = House.find(@friend.houses)
  end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :birthdate)
      # params.require(:friend).permit(:first_name, :last_name, :birthdate, houses: [:kind, :city])
    end
end
