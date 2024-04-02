Gem::Specification.new do |s|
  s.name        = 'test_visualizer'
  s.version     = '0.0.1'
  s.summary     = 'Visualize your test architecture.'
  s.description = 'This gem helps visualize your test architecture.'
  s.authors     = ['Jake Worth']
  s.email       = 'jake@jakeworth.com'
  s.homepage    = 'https://rubygems.org/gems/test-visualizer'
  s.license     = 'MIT'
  s.files       = `git ls-files -z`.split("\x0")
  s.bindir      = 'bin'
  s.executables << 'test_visualizer'
end
