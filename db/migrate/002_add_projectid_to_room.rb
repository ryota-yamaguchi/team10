class AddProjectidToRoom < ActiveRecord::Migration
  def up
    add_column :rooms, :project_id, :integer
  end
end
