class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        membership = Membership.create!(params.permit(:gym_id, :client_id, :charge))
        render json: membership
    end

    # created additional actions for testing purposes
    # def index
    #     memberships = Membership.all 
    #     render json: memberships
    # end
    # def destroy
    #     membership = Membership.find(params[:id])
    #     membership.destroy
    #     head :no_content
    # end

    private
    def render_unprocessable_entity_response
        render json: { message: "Membership could not be created"}, status: :unprocessable_entity
    end
end
