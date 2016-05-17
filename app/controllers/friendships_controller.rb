class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to profile_path, notice: 'Friendship was successfully created.' }
        format.json { render profile_path, status: :created, location: @friendship }
      else
        format.html { render :new }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to profile_path, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
    end
end
