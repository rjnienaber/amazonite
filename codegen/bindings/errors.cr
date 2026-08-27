module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Errors < Base
    @names : Array(Crinja::Value)

    getter names

    def initialize(names : Array(String))
      max_length = names.max_of(&.size)
      @names = names.map { |name| Crinja.value({spacing: " " * (max_length - name.size), value: name}) }
    end
  end
end
