class AddUseridToFlats < ActiveRecord::Migration[7.1]
  def change
    add_reference :flats, :user, foreign_key: true, index: false
  end
end
