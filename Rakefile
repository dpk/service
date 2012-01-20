
task :default do
  mrc = `which macrubyc`.strip # mrc == macruby compiler
  sh "#{mrc} -o service service.rb"
end

task :install do
  sh "install -b service /usr/local/bin/"
end

task :uninstall do
  rm "/usr/local/bin/service"
end

task :clean do
  rm "service"
  rm "service.o"
end
