
class IndividualsController < ApplicationController

  def new
    @division = Division.find(params[:division_id])
    @individual = Individual.new
    render :new
  end

  def create
    @division = Division.find(params[:division_id])
    @individual = @division.individuals.new(individual_params)
    if @individual.save
      redirect_to division_path(@division)
    else
      render :new
    end
  end


  def edit
    @individual = Individual.find(params[:id])
    render :edit
  end

  def show
    @individual = Individual.find(params[:id])
    render :show
  end

  def update
    @individual = Individual.find(params[:id])
    if @individual.update(individual_params)
      redirect_to individuals_path
    else
      render :edit
    end
  end

  def destroy
    @individual = Individual.find(params[:id])
    @individual.destroy
    redirect_to individuals_path
  end

  private
  def individual_params
    params.require(:individual).permit(:name, :division_id)
  end
end
