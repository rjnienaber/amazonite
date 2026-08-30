private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The Tag type enables you to specify a key-value pair that can be used to store information about
  # an CloudFormation stack.
  class Tag
    # A string used to identify this tag. You can specify a maximum of 128 characters for a tag key.
    # Tags owned by Amazon Web Services have the reserved prefix: `aws:`.
    property key : String

    # A string that contains the value for this tag. You can specify a maximum of 256 characters for a
    # tag value.
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
