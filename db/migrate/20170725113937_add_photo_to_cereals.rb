class AddPhotoToCereals < ActiveRecord::Migration[5.0]
  def change
    add_column :cereals, :photo, :string
  end
end
