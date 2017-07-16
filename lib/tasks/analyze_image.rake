require_relative '../../app/use_cases/import_and_analyze_image/use_case.rb'

namespace :analyze_image do
  desc "import and analyze image"
  task :go => [:environment] do |t, args|
  	image = 'https://www.dropbox.com/s/dc1nu3db0stnt3q/bookshelf_highres.JPG?dl=0'
  	ImportAndAnalyzeImage::UseCase.new(image).call
  end
end