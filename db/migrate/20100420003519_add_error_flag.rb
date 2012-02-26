class AddErrorFlag < ActiveRecord::Migration
  def self.up
    add_column :current_infos, :error_notified, :boolean
  end

  def self.down
    remove_column :current_infos, :error_notified
  end
end
