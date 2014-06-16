class ChangeModelName < ActiveRecord::Migration
  def change
    rename_table :classes, :klasses
  end
end
