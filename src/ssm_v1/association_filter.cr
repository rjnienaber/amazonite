private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class AssociationFilter
    include JSON::Serializable

    @[JSON::Field(key: "key", converter: AS::AssociationFilterKey)]
    property key : AssociationFilterKey

    @[JSON::Field(key: "value")]
    property value : String

    def initialize(
      @key : AssociationFilterKey,
      @value : String
    )
    end
  end
end
