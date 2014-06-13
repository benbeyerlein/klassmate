class CreateClasses < ActiveRecord::Migration
  def change
    create_table :classes do |t|
      t.integer :course_schedule_id
      t.datetime :class_datetime
      t.string :day_of_week

      t.timestamps

    end
  end
end
