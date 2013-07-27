# encoding: utf-8
class AnunciosController < ApplicationController
	before_filter :set_anuncio, only: [:destroy, :edit, :update, :delete, :approve]	
	before_filter :authenticate_user!
	before_filter :restrito_por_anunciante, except: :create

	def create
		anuncio = Anuncio.new params_anuncio
		anuncio.anunciante = current_user
			if anuncio.save
				flash[:notice] = "Seu anúncio foi cadastrado."
				redirect_to root_path
			else
				@marcas = Marca.por_nome			
				anuncio.build_marca if !anuncio.marca
				render "anuncios/cadastro", locals: {anuncio: anuncio} 
			end
	end

	def edit

	end

	def update
#		anuncio = Anuncio.find params[:id] esse codigo foi la pro before filter set_anuncio
		anuncio.anunciante = current_user
		if anuncio.update_attributes params_anuncio
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

	def approve
		authorize! :approve, @anuncio

		if @anuncio.update_attribute :aprovado, true
			flash[:notice] = "O anúncio foi aprovado."
		end
		redirect_to root_path
	end

private
	def set_anuncio
		@anuncio = Anuncio.find(params[:id])
	end

	def restrito_por_anunciante
		anunciante = Anuncio.find(params[:id]).anunciante
		is_admin = current_user.role == "admin"
		unless is_admin || anunciante == current_user
			redirect_to root_path
		end
	end

	def params_anuncio
		parameters = params[:anuncio]
			if parameters[:marca_attributes] && !parameters[:marca_attributes][:nome].empty?
			parameters.delete :marca_id
		else
			parameters.delete :marca_attributes
		end
		parameters
	end



end
