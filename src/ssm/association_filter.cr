private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @value
        raise Core::ValidationError.new("value length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@key, @value)
  end
end
