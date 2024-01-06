class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @users = User.all
  end

  def show
    @pet = Pet.find(params[:id])
    @users = User.all
  end

  def new
    @pet = Pet.new
    @users = User.all
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to @pet
    else
      render :new
    end
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
    @users = User.all
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
    params.require(:pet).permit(:name, :age, :species, :user_id)
  end
end
