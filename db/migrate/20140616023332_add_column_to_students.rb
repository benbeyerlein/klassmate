class AddColumnToStudents < ActiveRecord::Migration
  def change
       add_column :students, :profile_url, :string
  end
end
