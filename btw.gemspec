Gem::Specification.new do |s|
  s.name        = 'btw'
  s.version     = '0.2.0'
  s.date        = '2014-07-15'
  s.summary     = "Send change control messages to logstash (elasticsearch, kibana)"
  s.description = "A quick and lightweight tool for creating searchable change control logs. Writes to logstash using json over TCP"
  s.authors     = ["Fraser Scott"]
  s.email       = 'fraser.scott@gmail.com'
  s.executables << "btw"
  s.homepage    = 'https://github.com/zeroXten/btw'
  s.license       = 'MIT'
  s.add_runtime_dependency 'chronic', '~> 0.10'
  s.add_runtime_dependency 'multi_json', '~> 1.10'
end
