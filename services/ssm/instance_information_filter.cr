private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Describes a filter for a specific list of managed nodes. You can filter node information by
  # using tags. You specify tags by using a key-value mapping.
  #
  # Use this operation instead of the
  # DescribeInstanceInformationRequest$InstanceInformationFilterList method. The
  # `InstanceInformationFilterList` method is a legacy method and doesn't support tags.
  class InstanceInformationFilter
    include JSON::Serializable

    # The name of the filter.
    @[JSON::Field(key: "key", converter: AS::InstanceInformationFilterKey)]
    property key : InstanceInformationFilterKey

    # The filter values.
    @[JSON::Field(key: "valueSet")]
    property value_set : Array(String) = [] of String

    def initialize(
      @key : InstanceInformationFilterKey,
      @value_set : Array(String),
    )
    end

    def validate! : Nil
      if value = @value_set
        raise Core::ValidationError.new("valueSet must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("valueSet must have at most 100 item(s)") if value.size > 100
      end
    end

    def_equals_and_hash(@key, @value_set)
  end
end
