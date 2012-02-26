class CreatePlayInfos < ActiveRecord::Migration
  def self.up
    create_table :play_infos do |t|

	  t.integer :song_id
	  t.integer :listeners
      t.timestamps
    end
  end

  def self.down
    drop_table :play_infos
  end
end
