class ChangeColumnTypeInCourses < ActiveRecord::Migration
  def change
   change_column :courses, :school_course_id, :string
  end
end
