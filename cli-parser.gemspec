Gem::Specification.new do |s|
	s.name            = 'cli-parser'
	s.version         = '0.0.3'
	s.date            = '2015-04-14'
	s.summary         = 'CLI Parser'
	s.description     = 'A command-line parser. Extracts arguments, switches and options.'
	s.authors         = ['Taco Jan Osinga']
	s.email           = 'info@osingasoftware.nl'
	s.files           = `git ls-files lib`.split("\n") + %w(LICENSE)
	s.test_files      = `git ls-files test`.split("\n")
	s.require_paths   = ['lib']
	s.license         = 'MIT'
	s.homepage        = 'https://github.com/tjosinga/cli-parser'
end
