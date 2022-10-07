module Amazonite::Codegen::Service
  class Structure < Shape
    def self.structure?(json : JSON::Any)
      !!json["members"]?
    end

    @members : Array(Member)

    getter members

    def initialize(name : String, json : JSON::Any, resolver : ShapeResolver)
      super(name, json)

      @required = [] of String
      json["required"].as_a.each { |v| @required << v.as_s } if json["required"]?

      @members = json["members"].as_h.map do |name, json|
        required = (@required || [] of String).includes?(name)
        Member.new(name, required, json, resolver)
      end
    end
  end
end
