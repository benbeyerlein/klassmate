class InstructorCourseSchedulesController < ApplicationController
  def index
    @instructor_course_schedules = InstructorCourseSchedule.all
  end

  def show
    @instructor_course_schedule = InstructorCourseSchedule.find(params[:id])
  end

  def new
    @instructor_course_schedule = InstructorCourseSchedule.new
  end

  def create
    @instructor_course_schedule = InstructorCourseSchedule.new
    @instructor_course_schedule.instructor_id = params[:instructor_id]
    @instructor_course_schedule.course_schedule_id = params[:course_schedule_id]

    if @instructor_course_schedule.save
      redirect_to "/instructor_course_schedules", :notice => "Instructor course schedule created successfully."
    else
      render 'new'
    end
  end

  def edit
    @instructor_course_schedule = InstructorCourseSchedule.find(params[:id])
  end

  def update
    @instructor_course_schedule = InstructorCourseSchedule.find(params[:id])

    @instructor_course_schedule.instructor_id = params[:instructor_id]
    @instructor_course_schedule.course_schedule_id = params[:course_schedule_id]

    if @instructor_course_schedule.save
      redirect_to "/instructor_course_schedules", :notice => "Instructor course schedule updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @instructor_course_schedule = InstructorCourseSchedule.find(params[:id])

    @instructor_course_schedule.destroy

    redirect_to "/instructor_course_schedules", :notice => "Instructor course schedule deleted."
  end
end
