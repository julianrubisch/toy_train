require_relative "lib/toy_train/version"

Gem::Specification.new do |spec|
  spec.name        = "toy_train"
  spec.version     = ToyTrain::VERSION
  spec.authors     = ["Julian Rubisch"]
  spec.email       = ["julian@julianrubisch.at"]
  # spec.homepage    = "TODO"
  spec.summary     = "Summary of ToyTrain."
  spec.description = "Description of ToyTrain."
  spec.license     = "MIT"
  
  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 6.0"
end
