# encoding: utf-8
class AnunciosController < ApplicationController
	before_filter :set_anuncio, only: [:destroy, :edit, :update, :delete]	

	def create
		anuncio = Anuncio.new params[:anuncio]
			if anuncio.save
				flash[:notice] = "Seu anúncio foi cadastrado."
			end
		redirect_to root_path
	end

	def edit

	end

	def update
#		anuncio = Anuncio.find params[:id] esse codigo foi la pro before filter set_anuncio
		if @anuncio.update_attributes params[:anuncio]
			flash[:notice] = "O Anúncio foi atualizado."
		end
		redirect_to root_path
		end

	def delete

	end

	def destroy
		if @anuncio.destroy
			flash[:notice] = "O anúncio foi excluído."
		end
		redirect_to root_path
	end

private
	def set_anuncio
		@anuncio = Anuncio.find(params[:id])
	end

end