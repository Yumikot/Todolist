class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
     def index
        @lists = current_user.lists
     end
    
    def show
     
    end
    
    def new
        @list = List.new
    end
    
    def edit
       
    end
    
   def create
        @list = List.new(list_params)
        @list.user = current_user
    if @list.save
        redirect_to list_path(@list)
    else
        render 'new'
    end
   end 
   
   def update
       
       if @list.update(list_params)
           redirect_to @list
       else
           render 'edit'
       end
   end
   
   def destroy
      
       @list.destroy
      redirect_to lists_path
       
   end
   
    def list_params
        params.require(:list).permit(:title, :text)
    end
    
    def set_list
         @list= List.find(params[:id])
    end
    
    
    
end
