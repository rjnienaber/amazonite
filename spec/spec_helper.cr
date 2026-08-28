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
  @@translated = {} of String => JSON::Any

  def self.load(name : String)
    @@translated[name] ||= Amazonite::Codegen::Service::Files.translator(name).translate
  end
end
