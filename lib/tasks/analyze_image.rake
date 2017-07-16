require_relative '../../app/use_cases/import_and_analyze_image/use_case.rb'

namespace :analyze_image do
  desc "import and analyze image"
  task :go => [:environment] do |t, args|
  	image = 'https://www.dropbox.com/s/mw9mynfszih46ms/bookshelf.jpeg?dl=0'
  	ImportAndAnalyzeImage::UseCase.new(image).call
  end
end