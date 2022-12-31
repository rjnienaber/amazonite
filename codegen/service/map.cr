module Amazonite::Codegen::Service
  class Map < Shape
    def self.map?(json : JSON::Any)
      !!json["key"]? && !!json["value"]
    end

    getter key, value

    def initialize(name : String, json : JSON::Any, resolver : ShapeResolver)
      super(name, json)
      @key = Member.new("", true, json["key"], resolver)
      @value = Member.new("", true, json["value"], resolver)
    end
  end
end
