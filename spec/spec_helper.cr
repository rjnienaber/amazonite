require "spec"
require "assert-diff"
require "http"
require "webmock"

# WebMock's stub registry is global and is never reset between examples or
# files, so a stub registered by one spec can silently satisfy a request in
# an unrelated one if they hit the same method+URL+headers. Give each test
# its own URL/path where possible; where a fixed well-known host is
# unavoidable (e.g. the EC2/ECS metadata endpoints), pin down every env var
# a provider under test could react to rather than leaving one unset and
# assuming "no stub" - see spec/core/config_spec.cr's "no credentials
# resolvable" test for an example of a stub from another file leaking in.

require "../codegen/bindings/*"
require "../codegen/cli"
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
