Gem::Specification.new do |s|
  s.name        = 'btw'
  s.version     = '0.1.0'
  s.date        = '2014-07-14'
  s.summary     = "Send change control messages to logstash (elasticsearch, kibana)"
  s.description = "A quick and lightweight tool for creating searchable change control logs. Writes to logstash using json over TCP"
  s.authors     = ["Fraser Scott"]
  s.email       = 'fraser.scott@gmail.com'
  s.executables << "btw"
  s.homepage    = 'http://rubygems.org/gems/btw'
  s.license       = 'MIT'
  s.add_runtime_dependency 'chronic', '~> 0.10'
end
