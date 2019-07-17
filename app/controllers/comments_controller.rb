class CommentsController < ApplicationController
  before_action :authenticate_user!

  # Here we want to go into the place database and find the place with the ID of the page we are on
  # We then want to create a comment on that place. We use @place.comments.create because the 
  # Controller#Action section for this page would be comments#create. We can also do this because 
  # a place 'has_many' comments in the model.
  # We can then merge our comment_params dictionary with the current user to connect that in the
  # database as well.
  def create
    @place = Place.find(params[:place_id])
    @place.comments.create(comment_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :rating)
  end
end
