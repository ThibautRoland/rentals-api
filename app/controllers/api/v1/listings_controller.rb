class Api::V1::ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :destroy, :update]

  def index
    @listings = Listing.all
    if @listings
      render json: {status: "SUCCESS", message: "Fetched all the listings successfully", data:@listings}, status: :ok
    else
      render json: @listings.errors, status: :bad_request
    end
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      render json: {status: "SUCCESS", message: "Listing was created successfully", data: @friend}, status: :created
    else
      render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def show
    if @listing
      render json: {data: @listing}, state: :ok
    else
      render json: {message: "Listing could not be found"}, status: :bad_request
    end
  end

    def update
      if @listing.update(listing_params)
        render json: @listing
      else
        render json: { error: 'unable to update listing' }, status: 400
      end
    end

    def destroy
      if @listing.destroy
        render json: { message: "listing successfully destroyed"}, status:200
      else
        render json: { message: 'unable to delete listing'}, status: 400
      end
    end

  private

  def listing_params
    params.require(:listing).permit(:num_rooms, :listing_id)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
