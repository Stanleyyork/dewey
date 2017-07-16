require_relative '../../app/use_cases/import_and_analyze_image/use_case.rb'

namespace :analyze_image do
  desc "import and analyze image"
  task :go => [:environment] do |t, args|
  	image = 'https://www.dropbox.com/s/nrg76wy0tujlt4b/bookshelf_cropped.jpeg?dl=0'
  	ImportAndAnalyzeImage::UseCase.new(image).call
  end
end