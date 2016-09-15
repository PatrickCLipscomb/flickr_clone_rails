class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @images = Image.all
  end
  def show
    @image = Image.find(params[:id])
    @users = User.all
  end
  def edit
    @image = Image.find(params[:id])
  end
  def new
    @image = Image.new
  end
  def create
    @image = current_user.images.new(image_params)
    if @image.save
      flash[:notice] = "Image saved successfully"
      redirect_to images_path
    else
      flash[:alert] = "Image failed to save"
      render :new
    end
  end
  def update
    @image = Image.find(params[:id])
    @image = @image.update(image_params)
    redirect_to images_path
  end
  def destroy
    @image = Image.find(params[:id])
    if @image.delete
      flash[:notice] = "Image deleted"
      redirect_to images_path
    else
      flash[:alert] = "Image failed to delete"
    end
  end
  def favorite
    if !(current_user.favorite_images.include?(params[:id]))
      current_user.update_attribute(:favorite_images, current_user.favorite_images.push(params[:id]))
    end
  end
  def tag
    image = Image.find(params[:id])
    if !(image.user_tags.include?(params[:user_id]))
      image.update_attribute(:user_tags , image.user_tags.push(params[:user_id]))
      redirect_to image_path(image)
    end
  end
  private
  def image_params
    params.require(:image).permit(:description, :image, :user_id)
  end
end
