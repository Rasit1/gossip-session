class MessagesController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def index
    @all_u = User.all
    @message_all = Content.all
    @u = User.find(session[:user_id])
    @message = @u.contents
    #all user and its message show in index.html.erb
  end


  def new
    @a = Content.new
  end

  def create
      @user = User.find(params[:session_id])
      #content = Content.create(content: "\"#{params[:content]}\"")
      content = Content.create(content: params[:content])
      @user.contents << content
      @user.save
      redirect_to session_messages_path
  end

  def edit
  end

  def show

  end

  def updtade
  end

  def destroy
  end

  private
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
