class CreateAnuncios < ActiveRecord::Migration
  def change
    create_table :anuncios do |t|
      t.string :modelo
      t.integer :ano
      t.text :descricao
      t.decimal :valor, precision: 8, scale: 2

      t.timestamps
    end
  end
end
