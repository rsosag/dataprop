class OwnPropertiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_own_property, only: %i[edit update destroy]
  def index
    @own_properties = current_user.properties.includes(:community).page(params[:page])
  end

  def new
    @own_property = Property.new
  end

  def edit; end

  def create
    @own_property = current_user.properties.build(property_params)

    if @own_property.save
      flash[:success] = t('record_create_success')
      redirect_to own_properties_path
    else
      flash[:danger] = t('record_create_fail')
      render :new
    end
  end

  def update
    if @own_property.update(property_params)
      flash[:success] = t('record_create_success')
      redirect_to own_properties_path
    else
      flash[:danger] = t('record_update_fail')
      render :edit
    end
  end

  def destroy
    if @own_property.destroy
      flash[:success] = t('record_destroy_success')
    else
      flash[:danger] = t('record_destroy_fail')
    end

    redirect_to own_properties_path
  end

  private

  def property_params
    params.require(:property).permit(
      [:operation_type, :price, :currency, :community_id, :address, :area, :number_of_rooms, :number_of_bathrooms,
       :description, { images: [] }]
    )
  end

  def set_own_property
    @own_property = current_user.properties.find(params[:id])
  end
end