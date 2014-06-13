class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new
    @course.school_course_id = params[:school_course_id]
    @course.title = params[:title]
    @course.status = params[:status]
    @course.effective_start_quarter_id = params[:effective_start_quarter_id]
    @course.effective_end_quarter_id = params[:effective_end_quarter_id]
    @course.school_url = params[:school_url]
    @course.credits = params[:credits]

    if @course.save
      redirect_to "/courses", :notice => "Course created successfully."
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    @course.school_course_id = params[:school_course_id]
    @course.title = params[:title]
    @course.status = params[:status]
    @course.effective_start_quarter_id = params[:effective_start_quarter_id]
    @course.effective_end_quarter_id = params[:effective_end_quarter_id]
    @course.school_url = params[:school_url]
    @course.credits = params[:credits]

    if @course.save
      redirect_to "/courses", :notice => "Course updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy

    redirect_to "/courses", :notice => "Course deleted."
  end
end
