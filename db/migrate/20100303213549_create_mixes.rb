class CreateMixes < ActiveRecord::Migration
  def self.up
    create_table :mixes do |t|

      t.integer :mix_id
      t.string :icecast_display
      t.integer :length
      t.timestamps
    end
  end

  def self.down
    drop_table :mixes
  end
end
