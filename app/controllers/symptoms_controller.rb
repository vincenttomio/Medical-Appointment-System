class SymptomsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_doctor!

  def index
    @symptoms = Symptom.all
  end

  def new
    @symptom = Symptom.new
  end

  def create
    @symptom = Symptom.new(symptom_params)

    if @symptom.save
      redirect_to symptoms_path, notice: 'Sintoma cadastrado com sucesso!'
    else
      render :new
    end
  end

  def destroy
    @symptom = Symptom.find(params[:id])
    @symptom.destroy
    redirect_to symptoms_path, notice: 'Sintoma removido com sucesso!'
  end

  private

  def authorize_doctor!
    redirect_to root_path, alert: 'Acesso não autorizado' unless current_user.doctor?
  end

  def symptom_params
    params.require(:symptom).permit(:name)
  end
end