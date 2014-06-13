class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new
    @student.first_name = params[:first_name]
    @student.last_name = params[:last_name]
    @student.school_userid = params[:school_userid]
    @student.school_username = params[:school_username]
    @student.school_email = params[:school_email]
    @student.avatar_url = params[:avatar_url]

    if @student.save
      redirect_to "/students", :notice => "Student created successfully."
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    @student.first_name = params[:first_name]
    @student.last_name = params[:last_name]
    @student.school_userid = params[:school_userid]
    @student.school_username = params[:school_username]
    @student.school_email = params[:school_email]
    @student.avatar_url = params[:avatar_url]

    if @student.save
      redirect_to "/students", :notice => "Student updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])

    @student.destroy

    redirect_to "/students", :notice => "Student deleted."
  end
end
