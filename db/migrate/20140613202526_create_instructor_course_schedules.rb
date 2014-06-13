class CreateInstructorCourseSchedules < ActiveRecord::Migration
  def change
    create_table :instructor_course_schedules do |t|
      t.integer :instructor_id
      t.integer :course_schedule_id

      t.timestamps

    end
  end
end
