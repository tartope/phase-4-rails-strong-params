class BirdsController < ApplicationController
  wrap_parameters format: []

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create

    bird = Bird.create(params.permit(:name, :species))  #<--returns a new hash with only the params permitted.
    render json: bird, status: :created

    # bird = Bird.create(params)  #<--is not allowed due to Rails built-in security; will get an error message.
    # render json: bird, status: :created

    # bird = Bird.create(name: params[:name], species: params[:species])  #<--lines 15 and 16 is valid to avoid mass assignment but can become long to name each param if there are lots of params.
    # render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

end
