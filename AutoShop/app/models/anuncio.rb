class Anuncio < ActiveRecord::Base
	belongs_to :marca
	belongs_to :anunciante, class_name: "User"
  
	attr_accessible :ano, :descricao, :modelo, :valor, :marca_attributes, :marca_id
	accepts_nested_attributes_for :marca

	validates_presence_of :modelo, :descricao
	

	def self.aprovados
		where aprovado: true
	end

end
