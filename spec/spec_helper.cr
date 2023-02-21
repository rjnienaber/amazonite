require "spec"
require "assert-diff"
require "http"
require "webmock"

require "../codegen/bindings/*"
require "../codegen/render"
require "../codegen/service/*"

require "../src/core/**"

require "./mocks/**"

def load_fixture(*path)
  File.read(File.join(__DIR__, "..", "spec", "fixtures", *path))
end

class ServiceJson
  @@files = {} of String => JSON::Any

  def self.load(*path)
    filepath = File.join(__DIR__, "..", "aws-sdk-js", "apis", *path)
    return @@files[filepath] if @@files.has_key?(filepath)
    json = JSON.parse(File.read(filepath))
    @@files[filepath] = json
  end
end

def compare_strings(actual : String, expected : String)
  puts "ACTUAL\n#{actual}"
  puts "EXPECTED\n#{expected}"
  actual.lines.zip?(expected.lines).each do |actual, expected|
    next if actual == expected
    puts "actual: #{actual.inspect}"
    puts "expect: #{expected.inspect}"
  end
end
