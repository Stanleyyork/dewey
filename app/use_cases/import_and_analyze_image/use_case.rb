require 'open-uri'

module ImportAndAnalyzeImage
	class UseCase
		def self.call(image)
	      new(image)
	    end

	    def initialize(image)
	    	@image = 'https://dl.dropboxusercontent.com' + image.split('.com').last
	    	@image_analysis = ImageAnalysis.create(image_link: image)
	    	@books = {}
	    end

	    def call
	      analyze_image
	      retrieve_books
	    end

	    private
	    attr_reader :image, :image_analysis, :books, :search_queries

	    def analyze_image
			response = GoogleCloudVision::Classifier.new(ENV['GOOGLE_API_KEY'],
			  [
			    { image: open(image), detection: 'TEXT_DETECTION', max_results: 10 }
			  ]).response
			puts response.inspect
			text = response['responses'].first['textAnnotations']
			description = text.first['description']
			vertices = text.first['boundingPoly']['vertices']
			image_analysis.update_attributes({
				description: description,
				x1: vertices[0]['x'],
				y1: vertices[0]['y'],
				x2: vertices[1]['x'],
				y2: vertices[1]['y'],
				x3: vertices[2]['x'],
				y3: vertices[2]['y'],
				x4: vertices[3]['x'],
				y4: vertices[3]['y']
			})
			@search_queries = description.split("\n")
			text.each_with_index do |result, index|
				next if index == 0
				save_analyzed_result(result)
			end
		end

		def save_analyzed_result(result)
			desc = result['description']
			vertices = result['boundingPoly']['vertices']
			image_analysis.image_analysis_texts.create({
				description: desc,
				x1: vertices[0]['x'],
				y1: vertices[0]['y'],
				x2: vertices[1]['x'],
				y2: vertices[1]['y'],
				x3: vertices[2]['x'],
				y3: vertices[2]['y'],
				x4: vertices[3]['x'],
				y4: vertices[3]['y']
			})
		end

		def retrieve_books
			search_queries.each do |query|
				ia = ImageAnalysisText.where("description LIKE ?", "%#{query.split(" ").first}%").first
				result = GoogleBooks.search(query, {:api_key => ENV['GOOGLE_API_KEY']})
				book = result.first
				puts result.inspect if book.nil?
				next if book.nil?
				Book.create({
					query: query,
					image_analysis_id: image_analysis.id,
					title: book.title,
					authors: book.authors,
					description: book.description,
					page_count: book.page_count,
					thumbnail: book.image_link(:zoom => 2),
					x: ia.try(:x1),
					y: ia.try(:y1)
				})
			end
		end
	end
end