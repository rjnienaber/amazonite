module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Errors < Base
    getter names : Array(String)
    getter codes : Array(Crinja::Value)

    def initialize(@names : Array(String), error_codes : Hash(String, String) = {} of String => String)
      @codes = @names.map { |name| Crinja.value({name: name, code: error_codes[name]? || name}) }
    end
  end
end
