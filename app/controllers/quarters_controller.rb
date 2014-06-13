class QuartersController < ApplicationController
  def index
    @quarters = Quarter.all
  end

  def show
    @quarter = Quarter.find(params[:id])
  end

  def new
    @quarter = Quarter.new
  end

  def create
    @quarter = Quarter.new
    @quarter.term = params[:term]
    @quarter.academic_year = params[:academic_year]
    @quarter.start_date = params[:start_date]
    @quarter.end_date = params[:end_date]

    if @quarter.save
      redirect_to "/quarters", :notice => "Quarter created successfully."
    else
      render 'new'
    end
  end

  def edit
    @quarter = Quarter.find(params[:id])
  end

  def update
    @quarter = Quarter.find(params[:id])

    @quarter.term = params[:term]
    @quarter.academic_year = params[:academic_year]
    @quarter.start_date = params[:start_date]
    @quarter.end_date = params[:end_date]

    if @quarter.save
      redirect_to "/quarters", :notice => "Quarter updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @quarter = Quarter.find(params[:id])

    @quarter.destroy

    redirect_to "/quarters", :notice => "Quarter deleted."
  end
end
