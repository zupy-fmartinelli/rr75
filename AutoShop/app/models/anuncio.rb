class Anuncio < ActiveRecord::Base
  attr_accessible :ano, :descricao, :modelo, :valor
end
