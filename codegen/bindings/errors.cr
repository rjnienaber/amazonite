module Amazonite::Codegen::Bindings
  @[Crinja::Attributes]
  class Errors < Base
    @names : Array(Crinja::Value)

    getter names

    def initialize(names : Array(String))
      max_length = names.map(&.size).max
      @names = names.map { |n| Crinja.value({spacing: " " * (max_length - n.size), value: n}) }
    end
  end
end
