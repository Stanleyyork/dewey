require_relative '../../app/use_cases/import_and_analyze_image/use_case.rb'

namespace :analyze_image do
  desc "import and analyze image"
  task :go => [:environment] do |t, args|
  	# image = '../../Desktop/books.jpeg'
  	image = 'https://www.dropbox.com/s/m7qcoldhcbmkqqj/2A.jpg?dl=0'
  	ImportAndAnalyzeImage::UseCase.new(image).call
  end
end