class Ability
	include CanCan::Ability
	def initialize(user)
		alias_action :edit, :update, :destroy, :delete, to: :anunciar

		user ||= User.new
		if user.admin?
			can [:approve], Anuncio
			can [:anunciar], Anuncio
		end

		can [:anunciar], Anuncio do |anuncio|
			user == anuncio.anunciante
		end

	end
end
