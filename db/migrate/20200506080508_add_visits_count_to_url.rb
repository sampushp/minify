class AddVisitsCountToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :visits_count, :integer, deafult: 0
  end
end
