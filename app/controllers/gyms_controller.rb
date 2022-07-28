class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        gyms = Gym.all
        render json: gyms
    end

    def show
        gym = find_gym
        render json: gym
    end

    def update
        gym = find_gym
        gym.update!(params.permit[:name, :address])
        render json: gym
    end
    def destroy
        gym = find_gym
        gym.destroy
        head :no_content
    end

    private   

    def find_gym
        Gym.find(params[:id])
    end

    def render_not_found_response
        render json: { message: "Gym not found" }, status: :not_found
    end

    def render_unprocessable_entity_response
        render json: { message: "Gym could not be updated"}, status: :unprocessable_entity
        end
 
end
