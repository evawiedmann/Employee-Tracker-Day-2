
class IndividualsController < ApplicationController

  def index
    # Code for listing all individuals goes here.
    @individuals = Individual.all
    render :index
  end

  def new
    # Code for new individual form goes here.
    @individual = Individual.new
    render :new
  end

  def create
    # Code for creating a new individual goes here.
    @individual= Individual.new(individual_params)
    if @individual.save
      redirect_to individuals_path
    else
      render :new
    end
  end


  def edit
    # Code for edit individual form goes here.
    @individual = Individual.find(params[:id])
    render :edit
  end

  def show
    # Code for showing a single individual goes here.
    @individual = Individual.find(params[:id])
    render :show
  end

  def update
    # Code for updating an individual goes here.
    @individual = Individual.find(params[:id])
    if @individual.update(individual_params)
      redirect_to individuals_path
    else
      render :edit
    end
  end

  def destroy
    # Code for deleting an individual goes here.
    @individual = Individual.find(params[:id])
    @individual.destroy
    redirect_to individuals_path
  end

  private
  def individual_params
    params.require(:individual).permit(:name,:division_id )
  end
end
