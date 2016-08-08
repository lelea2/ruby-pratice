class Profiles < ActiveRecord::Migration
  def change
    rename_column :profiles, :birth_name, :birth_year
  end
end
