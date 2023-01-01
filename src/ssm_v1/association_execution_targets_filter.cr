private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class AssociationExecutionTargetsFilter
    include JSON::Serializable

    @[JSON::Field(key: "Key", converter: AS::AssociationExecutionTargetsFilterKey)]
    property key : AssociationExecutionTargetsFilterKey

    @[JSON::Field(key: "Value")]
    property value : String

    def initialize(
      @key : AssociationExecutionTargetsFilterKey,
      @value : String
    )
    end
  end
end
