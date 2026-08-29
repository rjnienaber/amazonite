private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class AccountLimit
    property name : String | Nil

    property value : Int32 | Nil

    def initialize(
      @name : String | Nil = nil,
      @value : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @value
        params << {"#{prefix}Value", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        value: Core::XMLValue.i32(node.xpath_node("*[local-name()='Value']")),
      )
    end
  end
end
