class CreateStudentCourseSchedules < ActiveRecord::Migration
  def change
    create_table :student_course_schedules do |t|
      t.integer :student_id
      t.integer :course_schedule_id

      t.timestamps

    end
  end
end
