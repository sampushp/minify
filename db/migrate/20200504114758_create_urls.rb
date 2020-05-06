class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original
      t.string :checksum
      t.integer :clicked, default: 0
      t.boolean :expired, default: false
      t.datetime :expire_at
      t.timestamps
    end
  end
end
