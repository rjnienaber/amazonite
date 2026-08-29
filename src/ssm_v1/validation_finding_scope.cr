private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ValidationFindingScope
    include JSON::Serializable

    @[JSON::Field(key: "Type", converter: AS::ValidationFindingScopeType)]
    property type : ValidationFindingScopeType | Nil

    @[JSON::Field(key: "Id")]
    property id : String | Nil

    def initialize(
      @type : ValidationFindingScopeType | Nil = nil,
      @id : String | Nil = nil,
    )
    end
  end
end
