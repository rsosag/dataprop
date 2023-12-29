class OwnPropertiesController < ApplicationController
  def index
    @own_properties = current_user.properties.includes(:community).page(params[:page])
  end

  def new
    @own_property = Property.new
  end

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

  private

  def property_params
    params.require(:property).permit(
      [:operation_type, :price, :currency, :community_id, :address, :area, :number_of_rooms, :number_of_bathrooms,
       :description, { images: [] }]
    )
  end
end
