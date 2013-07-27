class LojaController < ApplicationController
  def principal
		is_admin = current_user && current_user.role == "admin"
		@anuncios = if is_admin
			Anuncio.all
		else
			Anuncio.aprovados
		end
		@marcas = Marca.por_nome
		anuncio = Anuncio.new { |a| a.build_marca }		
		render "principal", locals: {anuncio: anuncio}
	end

end
