module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Errors < Base
    getter names : Array(String)

    def initialize(@names : Array(String))
    end
  end
end
