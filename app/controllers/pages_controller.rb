class PagesController < ApplicationController
  before_action :load_adventure

  def new
    @page = @adventure.pages.new
  end

  def create
    @page = @adventure.page.new(page_params)
    if @page.save
      @http://page.name = 'new'
      redirect_to [@adventure, @page]
    else
      flash[:errors] = @page.errors.full_messages
      render :edit
    end
  end

  def show
    # @page = Page.find(params[:id])
    @adventure = @adventure.pages.find(params[:id])            
    # render adventure_page_path(@adventure, @page)
  end
              
  def edit

  end

  private
  def pages_params
    params.require(:page).permit(:name, :text)
  end

  def load_adventure
    @adventure = Adventure.find(params[:adventure_id])
      redirect_to root_path if @adventure.blank?
  end
end
