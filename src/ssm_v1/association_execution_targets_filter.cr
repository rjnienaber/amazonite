private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Filters for the association execution.
  class AssociationExecutionTargetsFilter
    include JSON::Serializable

    # The key value used in the request.
    @[JSON::Field(key: "Key", converter: AS::AssociationExecutionTargetsFilterKey)]
    property key : AssociationExecutionTargetsFilterKey

    # The value specified for the key.
    @[JSON::Field(key: "Value")]
    property value : String

    def initialize(
      @key : AssociationExecutionTargetsFilterKey,
      @value : String,
    )
    end

    def validate! : Nil
      if value = @value
        raise Core::ValidationError.new("Value length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@key, @value)
  end
end
