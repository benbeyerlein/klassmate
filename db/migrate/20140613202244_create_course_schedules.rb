class CreateCourseSchedules < ActiveRecord::Migration
  def change
    create_table :course_schedules do |t|
      t.integer :course_id
      t.integer :quarter_id
      t.integer :section_id
      t.integer :instructor_id
      t.string :day_of_week
      t.time :time_of_day
      t.string :campus
      t.string :location
      t.date :first_class_date
      t.date :last_class_date

      t.timestamps

    end
  end
end
