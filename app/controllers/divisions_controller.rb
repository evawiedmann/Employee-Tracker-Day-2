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
    # Code for creating a new individual goes here.
    @division= Division.new(division_params)
    if @division.save
      redirect_to divisions_path
    else
      render :new
    end
  end

  def show
    @division = Division.find(params[:id])
    render :show
  end

  def edit
    @division = Division.find(params[:id])
    render :edit
  end

  def update
    @division = Division.find(params[:id])
    if @division.update(division_params)
      redirect_to divisions_path
    else
      render :edit
    end
  end

  def destroy
    # Code for deleting an individual goes here.
    @division = Division.find(params[:id])
    @division.destroy
    redirect_to divisions_path
  end
  # Other controller actions go here.

  private
  def division_params
    params.require(:division).permit(:name)
  end
end
