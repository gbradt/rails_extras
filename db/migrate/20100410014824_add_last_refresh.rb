class AddLastRefresh < ActiveRecord::Migration
  def self.up
    add_column :current_infos, :last_refresh, :datetime
  end

  def self.down
    remove_column :current_infos, :last_refresh
  end
end
