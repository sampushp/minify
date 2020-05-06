class RemoveColumnClickedFromUrl < ActiveRecord::Migration
  def change
  	remove_column :urls, :clicked
  end
end
