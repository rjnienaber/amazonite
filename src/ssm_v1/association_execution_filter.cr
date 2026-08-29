private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # Filters used in the request.
  class AssociationExecutionFilter
    include JSON::Serializable

    # The key value used in the request.
    @[JSON::Field(key: "Key", converter: AS::AssociationExecutionFilterKey)]
    property key : AssociationExecutionFilterKey

    # The value specified for the key.
    @[JSON::Field(key: "Value")]
    property value : String

    # The filter type specified in the request.
    @[JSON::Field(key: "Type", converter: AS::AssociationFilterOperatorType)]
    property type : AssociationFilterOperatorType

    def initialize(
      @key : AssociationExecutionFilterKey,
      @value : String,
      @type : AssociationFilterOperatorType,
    )
    end
  end
end
