module Amazonite::Codegen::Service
  class List < Shape
    def self.list?(json : JSON::Any)
      !!json["member"]?
    end

    getter member

    def initialize(name : String, json : JSON::Any, resolver : ShapeResolver)
      super(name, json)
      @member = Member.new("", true, json["member"], resolver)
    end
  end
end
