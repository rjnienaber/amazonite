require "spec"
require "assert-diff"
require "http"
require "webmock"

require "../src/codegen/**"
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
