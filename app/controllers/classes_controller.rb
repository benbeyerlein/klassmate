class ClassesController < ApplicationController
  def index
    @classes = Class.all
  end

  def show
    @class = Class.find(params[:id])
  end

  def new
    @class = Class.new
  end

  def create
    @class = Class.new
    @class.course_schedule_id = params[:course_schedule_id]
    @class.class_datetime = params[:class_datetime]
    @class.day_of_week = params[:day_of_week]

    if @class.save
      redirect_to "/classes", :notice => "Class created successfully."
    else
      render 'new'
    end
  end

  def edit
    @class = Class.find(params[:id])
  end

  def update
    @class = Class.find(params[:id])

    @class.course_schedule_id = params[:course_schedule_id]
    @class.class_datetime = params[:class_datetime]
    @class.day_of_week = params[:day_of_week]

    if @class.save
      redirect_to "/classes", :notice => "Class updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @class = Class.find(params[:id])

    @class.destroy

    redirect_to "/classes", :notice => "Class deleted."
  end
end
