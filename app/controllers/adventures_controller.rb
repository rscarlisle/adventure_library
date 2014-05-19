class AdventuresController < ApplicationController
  
  def index
    @library = Library.new
    @adventures = Adventure.all
    @local_adventures = Adventure.where(library_id = nil)
  end

  def new
    @adventure = Adventure.new
    @page = @adventure.pages.build
  end
    
  def create
    @adventure = Adventure.create(adventure_params)
    # @adventure.update_attributes(:guid => SecureRandom.urlsafe_base64(10))
    @adventure.guid = SecureRandom.urlsafe_base64(10)
    if @adventure.save
      redirect_to new_adventure_page_path(@adventure)
      # redirect_to adventures_path
    else
      flash[:errors] = @adventure.errors.full_messages
      render :edit
      redirect_to :back
    end
  end
  
  def show
    @adventure = Adventure.find(params[:id])
    @page = @adventure.pages.find_by_name("start")
  end
  
  def update
    @adventure = Adventure.find_by_id(params[:id])
    @adventure.update_attributes adventure_params
    redirect_to(@adventure)
  end
  
  def edit
    @adventure = Adventure.find(params[:id])
  end

  def destroy
    @adventure = Adventure.find(params[:id])
    @adventure.destroy
    redirect_to root_path
  end

private
  def adventure_params
    params.require(:adventure).permit(:title, :author, :pages_attributes => [:name, :text])
  end
end