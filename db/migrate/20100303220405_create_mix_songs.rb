class CreateMixSongs < ActiveRecord::Migration
  def self.up
    create_table :mix_songs do |t|

      t.integer :mix_id
      t.integer :track_id
      t.integer :start
      t.integer :end
      t.timestamps
    end
  end

  def self.down
    drop_table :mix_songs
  end
end
