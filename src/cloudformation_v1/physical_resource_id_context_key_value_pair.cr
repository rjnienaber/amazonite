private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Context information that enables CloudFormation to uniquely identify a resource. CloudFormation
  # uses context key-value pairs in cases where a resource's logical and physical IDs aren't enough
  # to uniquely identify that resource. Each context key-value pair specifies a resource that
  # contains the targeted resource.
  class PhysicalResourceIdContextKeyValuePair
    # The resource context key.
    property key : String

    # The resource context value.
    property value : String

    def initialize(
      @key : String,
      @value : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Key", @key}

      params << {"#{prefix}Value", @value}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")).not_nil!,
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='Value']")).not_nil!,
      )
    end
  end
end
