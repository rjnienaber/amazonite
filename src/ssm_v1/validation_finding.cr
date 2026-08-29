private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ValidationFinding
    include JSON::Serializable

    @[JSON::Field(key: "Type", converter: AS::ValidationFindingType)]
    property type : ValidationFindingType | Nil

    @[JSON::Field(key: "Code", converter: AS::ValidationFindingCode)]
    property code : ValidationFindingCode | Nil

    @[JSON::Field(key: "Message")]
    property message : String | Nil

    @[JSON::Field(key: "ProviderMessage")]
    property provider_message : String | Nil

    @[JSON::Field(key: "Scope")]
    property scope : ValidationFindingScope | Nil

    def initialize(
      @type : ValidationFindingType | Nil = nil,
      @code : ValidationFindingCode | Nil = nil,
      @message : String | Nil = nil,
      @provider_message : String | Nil = nil,
      @scope : ValidationFindingScope | Nil = nil,
    )
    end
  end
end
