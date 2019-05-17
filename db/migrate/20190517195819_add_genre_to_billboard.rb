class AddGenreToBillboard < ActiveRecord::Migration[5.2]
  def change
    add_column :billboards, :genre, :string
  end
end
