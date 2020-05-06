class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :country
      t.string :ip
      t.references :url
      t.timestamps
    end
  end
end
