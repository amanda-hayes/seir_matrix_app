class CharactersController < ApplicationController

        def index
            render json: Character.all
        end
    
        def show
            character = Character.find(params[:id])
            render json: {status: 200, character: character}
        end
    
        def create
            character = Character.new(character_params)
    
            if Character.save
                render(json: {character: character}, status: 201)
            else 
                render(json: {character: character}, status: 422)
            end
        end
    
        def update
            # create a variable that finds a Character
            character = Character.find(params[:id])
            # update the Character
            Character.update(character_params)
            # send the Character to the client
            render(json: {character: character}, status: 200)
        end
    
        def destroy
            character = Character.destroy(params[:id])
            render(status: 204)
        end
    
        private
    
        def character_params
            params.required(:character).permit(:name, :description, :img_url)
        end


end