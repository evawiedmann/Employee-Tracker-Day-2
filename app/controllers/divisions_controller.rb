class DivisionsController < ApplicationController
  def index
    @divisions = Division.all
    render :index
  end

  def new
    @division = Division.new
    render :new
  end

  def create
    @individual = Individual.find(params[:division_id])
    @division = @individual.divisions.new(division_params)
    if @division.save
      redirect_to individual_path(@individual)
    else
      render :new
    end
  end

  def show
    @individual = Individual.find(params[:individual_id])
    @division = Division.find(params[:id])
    render :show
  end

  def edit
    @individual = Individual.find(params[:individual_id])
    @division = Division.find(params[:id])
    render :edit
  end

  def update
    @division = Division.find(params[:id])
    if @division.update(division_params)
      redirect_to individual_path(@division.album)
    else
      render :edit
    end
  end

  def destroy
    @division= Division.find(params[:id])
    @division.destroy
    redirect_to individual_path(@division.individual)
  end
  # Other controller actions go here.

  private
  def division_params
    params.require(:division).permit(:name, :lyrics)
  end
end
