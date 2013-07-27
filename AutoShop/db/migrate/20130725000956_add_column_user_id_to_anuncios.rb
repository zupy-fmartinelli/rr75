class AddColumnUserIdToAnuncios < ActiveRecord::Migration
  def change
    add_column :anuncios, :anunciante_id, :integer
    add_index :anuncios, :anunciante_id
  end
end
