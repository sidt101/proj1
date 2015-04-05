class PokemonController < ApplicationController
	
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer = current_trainer
		@pokemon.save
		redirect_to root_url
	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health -= 10
		if @pokemon.health <= 0
			@pokemon.destroy
		else
			@pokemon.save
		end
		redirect_to :back
	end
	def new
		@pokemon = Pokemon.new
		@pokemon.health = 100
		@pokemon.level = 1
		@pokemon.name = @name
		@pokemon.trainer = current_trainer
		@pokemon.save
	end
end
		