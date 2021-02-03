class ItemsController < ApplicationController
  #ログインしていないと出品ページに遷移できないようにページ制限をする
  before_action :authenticate_user!, except:[:index]

 def index
  
 end

  def new
   
  end

  #def create
    #@items = Item.new(item_params)
    #if @item.save
      #redirect_to root_path
    #else
     # render :new
    #end
  #end
 end

