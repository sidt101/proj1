class PokemonsController < ApplicationController
	
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
  		@pokemon.destroy
  	end

	def create
	  	@pokemon = Pokemon.new
	  	@pokemon.trainer = current_trainer
	  	@pokemon.name = @name
	  	@pokemon.health = 100
	  	@pokemon.level = 1
	  	if @pokemon.save
	  		@pokemon.save
	  	  redirect_to current_trainer
	  	else
	  	  redirect_to new_pokemons_path, flash[:error] = @pokemon.errors.full_messages.to_sentence
	  	end
	  end

end
		