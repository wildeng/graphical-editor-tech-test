# frozen_string_literal: true

require_relative "lib/graphical_editor_tech_test/version"

Gem::Specification.new do |spec|
  spec.name          = "graphical_editor_tech_test"
  spec.version       = GraphicalEditorTechTest::VERSION
  spec.authors       = ["Alain Mauri"]
  spec.email         = ["wildeng@hotmail.com"]

  spec.summary       = "Tech Test for Kudocs"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "byebug", "~> 11"
end
