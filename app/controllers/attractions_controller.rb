class AttractionsController < ApplicationController
before_action :set_attraction, only: [:show, :edit, :update, :destroy]

def new
  @attraction = Attraction.new
end

def index
  @attractions = Attraction.all
end

def create
  @attraction = Attraction.create(attraction_params)
  @attraction.save
  redirect_to attraction_path(@attraction)
end

def edit
end

def update
  @attraction = Attraction.find(params[:id])
  @attraction.update(attraction_params)
  redirect_to attraction_path(@attraction)
end

def show
end

private

def set_attraction
  @attraction = Attraction.find(params[:id])
end

def attraction_params
  params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
end

end
