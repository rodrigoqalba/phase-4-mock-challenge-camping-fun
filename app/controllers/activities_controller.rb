class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activity = Activity.find_by(id: params[:id])
        if activity
            activity.destroy
            head :no_content
        else
            # you can add .full_messages after message if you like
            render json: { error: errors.message }, status: :not_found
        end
    end
end
