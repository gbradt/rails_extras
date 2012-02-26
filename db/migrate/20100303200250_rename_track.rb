class RenameTrack < ActiveRecord::Migration
  def self.up
  
    rename_column :display_infos, :song_id, :track_id
    rename_column :play_infos, :song_id, :track_id
  end

  def self.down

    rename_column :display_infos, :track_id, :song_id
    rename_column :play_infos, :track_id, :song_id
  end
end
