module Amazonite::Codegen::Service
  class Map < Shape
    def self.map?(json : JSON::Any)
      !!json["key"]? && !!json["value"]
    end

    getter key, value

    def initialize(name : String, json : JSON::Any, resolver : ShapeResolver)
      super(name, json)
      # "key"/"value" are the AWS query/XML protocols' default entry field
      # names when the model carries no smithy.api#xmlName override on the
      # map's key or value member.
      @key = Member.new("key", true, json["key"], resolver)
      @value = Member.new("value", true, json["value"], resolver)
    end
  end
end
