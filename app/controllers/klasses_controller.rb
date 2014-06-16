class KlassesController < ApplicationController
  def index
    @klasses = Klass.all
  end

  def show
    @klass = Klass.find(params[:id])
  end

  def new
    @klass = Klass.new
  end

  def create
    @klass = Klass.new
    @klass.course_schedule_id = params[:course_schedule_id]
    @klass.class_datetime = params[:class_datetime]
    @klass.day_of_week = params[:day_of_week]

    if @klass.save
      redirect_to "/classes", :notice => "Class created successfully."
    else
      render 'new'
    end
  end

  def edit
    @klass = Klass.find(params[:id])
  end

  def update
    @klass = Klass.find(params[:id])

    @klass.course_schedule_id = params[:course_schedule_id]
    @klass.class_datetime = params[:class_datetime]
    @klass.day_of_week = params[:day_of_week]

    if @klass.save
      redirect_to "/classes", :notice => "Class updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @klass = Klass.find(params[:id])

    @klass.destroy

    redirect_to "/classes", :notice => "Class deleted."
  end
end
