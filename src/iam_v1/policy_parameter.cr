private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about a policy parameter used to customize delegated permissions.
  class PolicyParameter
    # The name of the policy parameter.
    property name : String | Nil

    # The allowed values for the policy parameter.
    property values : Array(String) | Nil

    # The data type of the policy parameter value.
    property type : PolicyParameterTypeEnum | Nil

    def initialize(
      @name : String | Nil = nil,
      @values : Array(String) | Nil = nil,
      @type : PolicyParameterTypeEnum | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @name
        params << {"#{prefix}Name", value}
      end

      (@values || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Values.member.#{i}", item}
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        values: node.xpath_nodes("*[local-name()='Values']/*[local-name()='member']").map { |n| n.content },
        type: (n = node.xpath_node("*[local-name()='Type']")) ? AI::PolicyParameterTypeEnum.from_json_object_key?(n.content) : nil,
      )
    end

    def_equals_and_hash(@name, @values, @type)
  end
end
