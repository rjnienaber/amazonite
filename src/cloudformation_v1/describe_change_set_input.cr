private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeChangeSetInput
    property change_set_name : String

    property stack_name : String | Nil

    property next_token : String | Nil

    property include_property_values : Bool | Nil

    def initialize(
      @change_set_name : String,
      @stack_name : String | Nil = nil,
      @next_token : String | Nil = nil,
      @include_property_values : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ChangeSetName", @change_set_name}

      if value = @stack_name
        params << {"#{prefix}StackName", value}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @include_property_values
        params << {"#{prefix}IncludePropertyValues", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        change_set_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ChangeSetName']")).not_nil!,
        stack_name: Core::XMLValue.string(node.xpath_node("*[local-name()='StackName']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        include_property_values: Core::XMLValue.bool(node.xpath_node("*[local-name()='IncludePropertyValues']")),
      )
    end
  end
end
