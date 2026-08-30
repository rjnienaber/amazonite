private alias Core = Amazonite::Core

module Amazonite::IamV1
  # A structure that represents user-provided metadata that can be associated with an IAM resource.
  # For more information about tagging, see [Tagging IAM
  # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
  # Guide*.
  class Tag
    # The key name that can be used to look up or retrieve the associated value. For example,
    # `Department` or `Cost Center` are common choices.
    property key : String

    # The value associated with this tag. For example, tags with a key name of `Department` could have
    # values such as `Human Resources`, `Accounting`, and `Support`. Tags with a key name of `Cost
    # Center` might have values that consist of the number associated with the different cost centers
    # in your company. Typically, many resources have tags with the same key name but with different
    # values.
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

    def_equals_and_hash(@key, @value)
  end
end
