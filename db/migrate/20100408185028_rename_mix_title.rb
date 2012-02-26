class RenameMixTitle < ActiveRecord::Migration
  def self.up
    rename_column :mixes, :icecast_display, :icecast_title
  end

  def self.down
    rename_column :mixes, :icecast_title, :icecast_display
  end
end
