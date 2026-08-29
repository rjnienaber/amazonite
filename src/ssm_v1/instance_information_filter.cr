private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
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
  end
end
