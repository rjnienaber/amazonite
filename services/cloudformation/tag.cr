private alias Core = Amazonite::Core

module Amazonite::CloudFormation
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

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 128") if value.size > 128
      end

      if value = @value
        raise Core::ValidationError.new("Value length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Value length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@key, @value)
  end
end
