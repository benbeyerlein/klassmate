class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :school_course_id
      t.string :title
      t.string :status
      t.integer :effective_start_quarter_id
      t.integer :effective_end_quarter_id
      t.string :school_url
      t.float :credits

      t.timestamps

    end
  end
end
