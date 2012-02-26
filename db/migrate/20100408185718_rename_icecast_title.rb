class RenameIcecastTitle < ActiveRecord::Migration
  def self.up
    rename_column :display_infos, :icecast_display, :icecast_title
  end

  def self.down
    rename_column :display_infos, :icecast_title, :icecast_display
  end
end
