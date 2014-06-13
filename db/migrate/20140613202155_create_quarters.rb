class CreateQuarters < ActiveRecord::Migration
  def change
    create_table :quarters do |t|
      t.string :term
      t.string :academic_year
      t.date :start_date
      t.date :end_date

      t.timestamps

    end
  end
end
