class PostImagesController < ApplicationController
    before_action :authenticate_user!,{only:[:create, :new, :destroy, :show]}  
    def top
    end

    def top2
    end

    def new
        @post_image = PostImage.new
    end

    def create
        @post_image = PostImage.new(post_image_params)
        @post_image.user_id = current_user.id
        if @post_image.save
            redirect_to post_images_path
        else
            render :new
        end
    end

    def index
        @post_images = PostImage.paginate(page: params[:page], per_page: 9)
        @all_ranks = PostImage.find(Like.group(:post_image_id)
        .order('count(post_image_id) desc')
        .limit(3).pluck(:post_image_id))
    end

    def show
        @post_image = PostImage.find(params[:id])
        @post_comment = PostComment.new
    end

    def destroy
        @post_image = PostImage.find(params[:id])
        @post_image.destroy
        redirect_to post_images_path
    end

    private
    def post_image_params
        params.require(:post_image).permit(:image, :caption)
    end

end