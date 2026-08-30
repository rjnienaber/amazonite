private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Describes a filter.
  class AssociationFilter
    include JSON::Serializable

    # The name of the filter.
    #
    # `InstanceId` has been deprecated.
    @[JSON::Field(key: "key", converter: AS::AssociationFilterKey)]
    property key : AssociationFilterKey

    # The filter value.
    @[JSON::Field(key: "value")]
    property value : String

    def initialize(
      @key : AssociationFilterKey,
      @value : String,
    )
    end

    def_equals_and_hash(@key, @value)
  end
end
