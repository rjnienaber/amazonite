private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  # Identifies the specific resource scope of a validation finding.
  class ValidationFindingScope
    include JSON::Serializable

    # The type of the resource scope.
    @[JSON::Field(key: "Type", converter: AS::ValidationFindingScopeType)]
    property type : ValidationFindingScopeType | Nil

    # The ID of the resource within the scope.
    @[JSON::Field(key: "Id")]
    property id : String | Nil

    def initialize(
      @type : ValidationFindingScopeType | Nil = nil,
      @id : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@type, @id)
  end
end
