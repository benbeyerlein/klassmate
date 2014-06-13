class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new
    @instructor.first_name = params[:first_name]
    @instructor.last_name = params[:last_name]
    @instructor.school_userid = params[:school_userid]
    @instructor.school_username = params[:school_username]
    @instructor.school_email = params[:school_email]
    @instructor.avatar_url = params[:avatar_url]
    @instructor.school_dept = params[:school_dept]
    @instructor.school_bio_url = params[:school_bio_url]

    if @instructor.save
      redirect_to "/instructors", :notice => "Instructor created successfully."
    else
      render 'new'
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])

    @instructor.first_name = params[:first_name]
    @instructor.last_name = params[:last_name]
    @instructor.school_userid = params[:school_userid]
    @instructor.school_username = params[:school_username]
    @instructor.school_email = params[:school_email]
    @instructor.avatar_url = params[:avatar_url]
    @instructor.school_dept = params[:school_dept]
    @instructor.school_bio_url = params[:school_bio_url]

    if @instructor.save
      redirect_to "/instructors", :notice => "Instructor updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])

    @instructor.destroy

    redirect_to "/instructors", :notice => "Instructor deleted."
  end
end
