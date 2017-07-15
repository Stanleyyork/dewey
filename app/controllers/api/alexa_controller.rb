class Api::AlexaController < ApplicationController
	def show
		title = params[:book_title]
		@book = Book.find_by_title(title)
		@book = Book.where("title LIKE ?", "%#{title}%").first
		@grid = ImageAnalysis.find_by_id(book.image_analysis_id) unless @book.nil?
		if book.nil?
			render json: {response: "Sorry, I can't find that book"}
		else
			render json: {response: "#{book.title} book is at #{relative_place} (#{book.x}, #{book.y}, #{grid.image_link})"}
		end
	end

	private
	attr_reader :book, :grid

	def relative_place
		book_x = book.x
		book_y = book.y
		location = ""
		y_min = grid.y2
		y_max = grid.y3
		y_mid = (y_max - y_min)/2.0
		y_q3 = y_mid + ((y_max - y_mid)/2.0)
		y_q1 = y_mid - ((y_mid - y_min)/2.0)
		if book_y < y_q3 && book_y > y_mid
			location += "middle "
		elsif book_y > y_q1 && book_y < y_mid
			location += "middle "
		elsif book_y < y_mid
			location +=  "upper "
		else
			location += "bottom "
		end

		x_min = grid.x1
		x_max = grid.x2
		x_mid = (x_max - x_min)/2.0
		x_q3 = x_mid + ((x_max - x_mid)/2.0)
		x_q1 = x_mid - ((x_mid - x_min)/2.0)
		if book_x < x_q3 && book_x > x_mid
			location += "middle "
		elsif book_x > x_q1 && book_x < x_mid
			location += "middle "
		elsif book_x < x_mid
			location +=  "left"
		else
			location += "right"
		end
	end
end