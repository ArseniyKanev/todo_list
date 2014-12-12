class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
  	@lists = List.where(user_id: current_user)
  end

  def new
  	@list = current_user.lists.build
  end

  def create
  	@list = current_user.lists.build(list_params)

    if @list.save
      redirect_to @list
    else
      flash.now[:error] = @list.errors.full_messages.join("<br>").html_safe
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to :root
    else
      flash.now[:error] = @list.errors.full_messages.join("<br>").html_safe
      render 'edit'
    end
  end

  def destroy
    @list.destroy
    redirect_to :root
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
  	params.require(:list).permit(:title, :description)
  end
end