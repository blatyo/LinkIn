class ChatsController < ApplicationController
  before_filter :require_user

  def create
    @chat = current_user.chats.build(params[:chat])

    if @chat.save
      flash[:notice] = "Created chat!"
    else
      flash[:notice] = "Unable to create chat."
    end
    
    redirect_to :back
  end
end
