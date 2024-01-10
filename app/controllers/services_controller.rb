class ServicesController < ApplicationController
  def index
    @service = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(pet_params)
    @service.user = current_user
    @service.save!
    redirect_to pets_path
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy!
    redirect_to services_path
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to @service
    else
      render :edit
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :date_of_birth, :breed, :weight, :size, :description, :user_id, photos: [])
  end
end
