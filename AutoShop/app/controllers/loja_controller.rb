class LojaController < ApplicationController
  def principal
		@anuncio = Anuncio.new		
		@anuncios = Anuncio.all
	end

end
