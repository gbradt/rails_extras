class CreateCurrentInfos < ActiveRecord::Migration
  def self.up
    create_table :current_infos do |t|

      t.integer :listeners
      t.string :mix_icecast_title
      t.string :artist
      t.string :title
      t.string :year
      t.timestamps
    end
  end

  def self.down
    drop_table :current_infos
  end
end
