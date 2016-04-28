class OsagoCalculatorsController < ApplicationController
  def create
    calculator = OsagoCalculator.new(calculator_params)
    if calculator.valid?
      calculator.save
      return redirect_to edit_osago_calculator_url(calculator)
    else
      flash[:error] = calculator.errors.full_messages.join(', ')
    end
    redirect_to '/'
  end

  def edit
    @calculator = OsagoCalculator.find(params[:id])
  end

  private

  def calculator_params
    params.require(:osago_calculator).permit(
      :city_id, :drivers_count, :driver_experience, :car_id,
      :car_horse_power_id
    )
  end
end
