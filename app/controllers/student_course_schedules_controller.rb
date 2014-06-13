class StudentCourseSchedulesController < ApplicationController
  def index
    @student_course_schedules = StudentCourseSchedule.all
  end

  def show
    @student_course_schedule = StudentCourseSchedule.find(params[:id])
  end

  def new
    @student_course_schedule = StudentCourseSchedule.new
  end

  def create
    @student_course_schedule = StudentCourseSchedule.new
    @student_course_schedule.student_id = params[:student_id]
    @student_course_schedule.course_schedule_id = params[:course_schedule_id]

    if @student_course_schedule.save
      redirect_to "/student_course_schedules", :notice => "Student course schedule created successfully."
    else
      render 'new'
    end
  end

  def edit
    @student_course_schedule = StudentCourseSchedule.find(params[:id])
  end

  def update
    @student_course_schedule = StudentCourseSchedule.find(params[:id])

    @student_course_schedule.student_id = params[:student_id]
    @student_course_schedule.course_schedule_id = params[:course_schedule_id]

    if @student_course_schedule.save
      redirect_to "/student_course_schedules", :notice => "Student course schedule updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @student_course_schedule = StudentCourseSchedule.find(params[:id])

    @student_course_schedule.destroy

    redirect_to "/student_course_schedules", :notice => "Student course schedule deleted."
  end
end
