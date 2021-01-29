class ItemsController < ApplicationController

 def index
  
 end

 def new
  @items = Item.new
 end

 def create
    @items = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
 end

