class AddMarcaIdToAnuncios < ActiveRecord::Migration
  def change
    add_column :anuncios, :marca_id, :integer
  end
end
