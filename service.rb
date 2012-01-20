#!/usr/bin/env macruby

framework 'AppKit'
require 'optparse'

def apply_service name, string
  pb = NSPasteboard.pasteboardWithUniqueName
  pb.declareTypes([NSStringPboardType], owner: nil)
  pb.setString(string, forType:NSStringPboardType)
  if NSPerformService(name, pb)
    pb.dataForType(NSStringPboardType).to_str
  else
    return false
  end
end

opts = []
ARGV.each do |arg|
  if arg[0] == '-'
    opts << arg
    ARGV.shift
  else
    break
  end
end

if opts.include? '--help' or opts.include? '-h'
  puts <<-EOS
    Usage: #{File.basename $0} service [string]
    
    Options:
    -q, --quiet       Don't output the result of the service.
  EOS
  exit 0
end

if ARGV.empty?
  STDERR.puts "#{File.basename $0}: no arguments given"
  exit 2
end

if ARGV[1]
  str = ARGV[1]
else
  str = STDIN.read
end

result = apply_service ARGV[0], str
if not result
  STDERR.puts "#{File.basename $0}: no service is available named \"#{ARGV[0]}\""
  exit 1
end

unless opts.include? '--quiet' or opts.include? '-q'
  print result
end
