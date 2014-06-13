class CourseSchedulesController < ApplicationController
  def index
    @course_schedules = CourseSchedule.all
  end

  def show
    @course_schedule = CourseSchedule.find(params[:id])
  end

  def new
    @course_schedule = CourseSchedule.new
  end

  def create
    @course_schedule = CourseSchedule.new
    @course_schedule.course_id = params[:course_id]
    @course_schedule.quarter_id = params[:quarter_id]
    @course_schedule.section_id = params[:section_id]
    @course_schedule.instructor_id = params[:instructor_id]
    @course_schedule.day_of_week = params[:day_of_week]
    @course_schedule.time_of_day = params[:time_of_day]
    @course_schedule.campus = params[:campus]
    @course_schedule.location = params[:location]
    @course_schedule.first_class_date = params[:first_class_date]
    @course_schedule.last_class_date = params[:last_class_date]

    if @course_schedule.save
      redirect_to "/course_schedules", :notice => "Course schedule created successfully."
    else
      render 'new'
    end
  end

  def edit
    @course_schedule = CourseSchedule.find(params[:id])
  end

  def update
    @course_schedule = CourseSchedule.find(params[:id])

    @course_schedule.course_id = params[:course_id]
    @course_schedule.quarter_id = params[:quarter_id]
    @course_schedule.section_id = params[:section_id]
    @course_schedule.instructor_id = params[:instructor_id]
    @course_schedule.day_of_week = params[:day_of_week]
    @course_schedule.time_of_day = params[:time_of_day]
    @course_schedule.campus = params[:campus]
    @course_schedule.location = params[:location]
    @course_schedule.first_class_date = params[:first_class_date]
    @course_schedule.last_class_date = params[:last_class_date]

    if @course_schedule.save
      redirect_to "/course_schedules", :notice => "Course schedule updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @course_schedule = CourseSchedule.find(params[:id])

    @course_schedule.destroy

    redirect_to "/course_schedules", :notice => "Course schedule deleted."
  end
end
