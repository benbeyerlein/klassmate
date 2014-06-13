class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :school_userid
      t.string :school_username
      t.string :school_email
      t.string :avatar_url

      t.timestamps

    end
  end
end
