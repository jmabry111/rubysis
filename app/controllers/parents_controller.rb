class ParentsController < ApplicationController
  
  def new
    @parent = Parent.new
  end
  
  def create
    @parent = Parent.new(params[:parent])
    
      if @parent.save
        session[:current_parent] = @parent.id
        redirect_to parents_path, notice: 'Parent saved.'
      else
        render action: "new"
      end
  end
  
  def show
    @parent = Parent.find(params[:id])
  end
  
end
