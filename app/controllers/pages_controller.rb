class PagesController < ApplicationController

  def index
    @pages = Page.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @pages}
      format.json { render json: @pages}
    end
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page }
        format.json {render action: 'show', status: :created, location: @person }
        format.js {render action: 'show', status: :created, location: @person }
      else
        format.html {render action: 'new'}
        format.json {render json: @page.erros, status: :unporcessable_entity}
        format.js {render json: @page.erros, status: :unprocessable_entity }
      end
    end
  end

  def new
    @pages = Page.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end


  private
    def page_params
      params.require(:page).permit(:page_number, :text, :image, :sound, :book_id)
    end
end

# t.string   "page_number"
# t.text     "text"
# t.string   "image"
# t.text     "sound"
# t.integer  "book_id"

# book_pages 　　GET    /books/:book_id/pages(.:format)          pages#index
#               POST   /books/:book_id/pages(.:format)          pages#create
# new_book_page GET    /books/:book_id/pages/new(.:format)      pages#new
# edit_book_page GET    /books/:book_id/pages/:id/edit(.:format) pages#edit
#      book_page GET    /books/:book_id/pages/:id(.:format)      pages#show
#                PATCH  /books/:book_id/pages/:id(.:format)      pages#update
#                PUT    /books/:book_id/pages/:id(.:format)      pages#update
#                DELETE /books/:book_id/pages/:id(.:format)      pages#destroy