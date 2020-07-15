class LikeController < ApplicationController
    def index 
        if like_params.has_key?(:user_id)
            @like_stuff = Like.where(user_id: like_params[:user_id])
        elsif like_params.has_key?(:likeable_type)
            liked_class = like_params[:likeable_type].constantize
            @like_stuff = liked_class.find(like_params[:likeable_id]).likes
        end

        render json: @like_stuff
    end


    def create
        new_like = Like.new(like_params)

        if new_like.save
            render json: new_like
        else
            render json: new_like.errors.full_messages, status: :unprocessable_entity 
        end
    end


    def show
        like_stuff = Like.find(params[:id])
    end
    
    def destroy
        like_stuff = Like.find(params[:id])

        if like_stuff.destroy
            render json: like_stuff
        else
            render json: like_stuff.errors.full_messages, status: :unprocessable_entity
        end

    end

    private
    
    def like_params
        params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
    end
end
