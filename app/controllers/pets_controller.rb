class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    @pet.save!
    redirect_to pets_path
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy!
    redirect_to pets_path
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to @pet
    else
      render :edit
    end
  end

  private 

  def pet_params
    params.require(:pet).permit(:name, :date_of_birth, :breed, :weight, :size, :description, :user_id, photos: [])
  end
end
