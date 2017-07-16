class Api::AlexaController < ApplicationController
	def show
		title = params[:book_title]
		@book = Book.find_by_title(title)
		@book = Book.where("title LIKE ?", "%#{title}%").first if @book.nil?
		@book = Book.where("title LIKE ?", "%#{title.capitalize}%").first if @book.nil?
		@book = Book.where("title LIKE ?", "%#{title.split(" ").map{|x| x.capitalize}.join(" ")}%").first if @book.nil?
		@grid = ImageAnalysis.find_by_id(book.image_analysis_id) unless @book.nil?
		if book.nil?
			render json: {response: "Sorry, I can't find that book"}
		else
			render json: {response: "#{book.title} is near the #{relative_place}"}
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
		y_first_third = y_min + ((y_max - y_min)/3)
		y_second_third = y_max - ((y_max - y_min)/3)
		# y_mid = (y_max - y_min)/2.0
		# y_q3 = y_mid + ((y_max - y_mid)/2.0)
		# y_q1 = y_mid - ((y_mid - y_min)/2.0)
		if book_y < y_second_third && book_y > y_first_third
			location += "middle shelf "
		elsif book_y < y_first_third
			location +=  "top shelf "
		else
			location += "bottom shelf "
		end

		x_min = grid.x1
		x_max = grid.x2
		x_mid = (x_max - x_min)/2.0
		x_q3 = x_mid + ((x_max - x_mid)/2.0)
		x_q1 = x_mid - ((x_mid - x_min)/2.0)
		if book_x < x_mid && book_x > x_q1
			location += "slightly to the left"
		elsif book_x > x_q1 && book_x < x_mid
			location += "slightly to the right"
		elsif book_x < x_q1
			location +=  "on the far left"
		elsif book_x > x_q3
			location += "on the far right"
		end
	end
end