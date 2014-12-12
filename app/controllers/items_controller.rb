class ItemsController < ApplicationController
	before_action :set_list
	before_action :set_item, except: [:create]

	def create
		@item = @list.items.build(item_params)
		if !@item.save
			flash[:error] = @item.errors.full_messages.join("<br>").html_safe
		end
		redirect_to @list
	end

	def destroy
		@item.destroy
		redirect_to @list
	end

	def complete
		@item.update_attribute(:done, true)
		redirect_to @list
	end

	private

	def set_list
		@list = List.find(params[:list_id])
	end

	def set_item
		@item = @list.items.find(params[:id])
	end

	def item_params
		params.require(:item).permit(:content, :done)
	end
end
