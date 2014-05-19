class PagesController < ApplicationController
  before_action :load_adventure

  def index
    @pages = @adventure.pages.all
    # load_adventure

  def new
    # @page = @adventure.pages.new
    @page = @adventure.pages.build
  end

  def create
    # load_adventure
    @page = @adventure.pages.create page_params
    redirect_to root_path
  end

  # def create
  #   @page = @adventure.page.new(page_params)
  #   if @page.save
  #     @http://page.name = 'new'
  #     redirect_to [@adventure, @page]
  #   else
  #     flash[:errors] = @page.errors.full_messages
  #     render :edit
  #   end
  #end

  def show
    @pages = @adventure.pages.find_by_name("start")
    @adventure = Adventure.find(params[:adventure_id])
    
    ## @page = Page.find(params[:id])
    #load_page
    # @adventure = @adventure.pages.find(params[:id])            
    ## render adventure_page_path(@adventure, @page)
  end
              
  def edit

  end

  def load_page
    @page = @adventure.pages.find(params[:id])
    redirect_to root_path if @page.blank? 
    end           
  end

  private
  def page_params
    params.require(:page).permit(:name, :text)
  end

  def load_adventure
    @adventure = Adventure.find(params[:adventure_id])
      redirect_to root_path if @adventure.blank?
  end
end
