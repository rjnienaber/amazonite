private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class AssociationExecutionFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key", converter: AS::AssociationExecutionFilterKey)]
    property key : AssociationExecutionFilterKey

    @[JSON::Field(key: "Value")]
    property value : String

    @[JSON::Field(key: "Type", converter: AS::AssociationFilterOperatorType)]
    property type : AssociationFilterOperatorType

    def initialize(
      @key : AssociationExecutionFilterKey,
      @value : String,
      @type : AssociationFilterOperatorType
    )
    end
  end
end
