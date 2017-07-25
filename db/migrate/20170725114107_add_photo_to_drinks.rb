class AddPhotoToDrinks < ActiveRecord::Migration[5.0]
  def change
    add_column :drinks, :photo, :string
  end
end
