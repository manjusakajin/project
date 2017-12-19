class BookReviewController < ApplicationController
  def show
    if valid_page?
      if params[:page] == "home"
        @books = Book.all.order(created_at: :desc)
          .paginate page: params[:page_number], per_page: 4
        @reviews = Review.all.order(created_at: :desc)
          .paginate page: params[:page_number], per_page: 4
      end
      render template: "book_review/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root +
      "app/views/book_review/#{params[:page]}.html.erb"))
  end
end
