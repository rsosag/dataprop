class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_own_property, only: %i[edit update destroy]
  def index
    @properties = Property.includes(:community).page(params[:page])
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def edit; end

  def create
    @property = current_user.properties.build(property_params)

    if @property.save
      flash[:success] = t('record_create_success')
      redirect_to properties_path
    else
      flash[:danger] = t('record_create_fail')
      render :new
    end
  end

  def update
    if @property.update(property_params)
      flash[:success] = t('record_create_success')
      redirect_to properties_path
    else
      flash[:danger] = t('record_update_fail')
      render :edit
    end
  end

  def destroy
    if @property.destroy
      flash[:success] = t('record_destroy_success')
    else
      flash[:danger] = t('record_destroy_fail')
    end

    redirect_to properties_path
  end

  def own_properties
    @properties = current_user.properties.includes(:community).page(params[:page])
  end

  private

  def property_params
    params.require(:property).permit(
      [:operation_type, :price, :currency, :community_id, :address, :area, :number_of_rooms, :number_of_bathrooms,
       :description, { images: [] }]
    )
  end

  def set_own_property
    @property = current_user.properties.find(params[:id])
  end
end
