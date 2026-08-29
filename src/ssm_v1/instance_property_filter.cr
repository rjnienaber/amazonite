private alias AS = Amazonite::SsmV1

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
  end
end
