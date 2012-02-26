class CreateDisplayInfos < ActiveRecord::Migration
  def self.up
    create_table :display_infos do |t|

      t.integer :song_id
      t.string :icecast_display
      t.string :artist
      t.string :title
      t.string :year
      t.timestamps
    end
  end

  def self.down
    drop_table :display_infos
  end
end
