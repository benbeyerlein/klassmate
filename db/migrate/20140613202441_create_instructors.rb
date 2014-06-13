class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :school_userid
      t.string :school_username
      t.string :school_email
      t.string :avatar_url
      t.string :school_dept
      t.string :school_bio_url

      t.timestamps

    end
  end
end
