private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes a filter for a specific list of managed nodes. You can filter node information by
  # using tags. You specify tags by using a key-value mapping.
  class InstancePropertyFilter
    include JSON::Serializable

    # The name of the filter.
    @[JSON::Field(key: "key", converter: AS::InstancePropertyFilterKey)]
    property key : InstancePropertyFilterKey

    # The filter values.
    @[JSON::Field(key: "valueSet")]
    property value_set : Array(String) = [] of String

    def initialize(
      @key : InstancePropertyFilterKey,
      @value_set : Array(String),
    )
    end

    def validate! : Nil
      if value = @value_set
        raise Core::ValidationError.new("valueSet must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("valueSet must have at most 40 item(s)") if value.size > 40
      end
    end

    def_equals_and_hash(@key, @value_set)
  end
end
