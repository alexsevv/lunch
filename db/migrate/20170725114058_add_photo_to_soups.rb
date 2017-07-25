class AddPhotoToSoups < ActiveRecord::Migration[5.0]
  def change
    add_column :soups, :photo, :string
  end
end
