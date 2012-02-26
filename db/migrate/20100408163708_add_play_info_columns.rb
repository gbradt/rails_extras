class AddPlayInfoColumns < ActiveRecord::Migration
  def self.up
    add_column :play_infos, :icecast_title, :string
    add_column :play_infos, :mix_id, :integer
  end

  def self.down
    remove_column :play_infos, :icecast_title
    remove_column :play_infos, :mix_id
  end
end
