class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :verifica_locale

	def verifica_locale
		lingua_preferida = params[:locale] || request.
			env['HTTP_ACCEPT_LANGUAGE'].
			scan(/^[a-z]{2}/).
			first

		I18n.locale = lingua_preferida
	end

	rescue_from CanCan::AccessDenied,
							with: :sem_autorizacao
	
	def default_url_options
		{:locale => I18n.locale} 
	end

private

	def sem_autorizacao
		redirect_to root_path,
			alert: "Acesso Negado"
	end
		
end
