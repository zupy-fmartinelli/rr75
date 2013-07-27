class AddAprovadoToAnuncios < ActiveRecord::Migration
  def change
    add_column :anuncios, :aprovado, :boolean, default: false
    add_index :anuncios, :aprovado
  end
end
