private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Represents a tag that is applied to roles that are created from a role template. The key and
  # value can include `@{parameter}` placeholders that are replaced with template parameter values
  # when the role is created.
  class TagTemplate
    # The key name of the tag.
    property key : String

    # The value associated with the tag key.
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
        raise Core::ValidationError.new("Key does not match the required pattern") unless value.matches?(Regex.new("^[\\p{L}\\p{Z}\\p{N}_.:/=+\\-@{}]+$"))
      end

      if value = @value
        raise Core::ValidationError.new("Value length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Value length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Value does not match the required pattern") unless value.matches?(Regex.new("^[\\p{L}\\p{Z}\\p{N}_.:/=+\\-@{}]*$"))
      end
    end

    def_equals_and_hash(@key, @value)
  end
end
