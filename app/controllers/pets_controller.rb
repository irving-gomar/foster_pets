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
    redirect_to @pet
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.destroy
      redirect_to pets_path
    else
      render :show
    end
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
    params.require(:pet).permit(:pet_name, :date_of_birth, :breed, :weight, :size, :medical_condition, :user_id)
  end
end
