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

      @members = json["members"].as_h.map do |member_name, member_json|
        required = (@required || [] of String).includes?(member_name)
        Member.new(member_name, required, member_json, resolver)
      end
    end
  end
end
