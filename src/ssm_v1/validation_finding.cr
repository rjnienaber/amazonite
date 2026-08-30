private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # A validation finding from a cloud connector validation check.
  class ValidationFinding
    include JSON::Serializable

    # The type of the validation finding.
    @[JSON::Field(key: "Type", converter: AS::ValidationFindingType)]
    property type : ValidationFindingType | Nil

    # A code that identifies the specific validation finding.
    @[JSON::Field(key: "Code", converter: AS::ValidationFindingCode)]
    property code : ValidationFindingCode | Nil

    # A message that describes the validation finding.
    @[JSON::Field(key: "Message")]
    property message : String | Nil

    # A message from the third-party cloud provider related to the validation finding.
    @[JSON::Field(key: "ProviderMessage")]
    property provider_message : String | Nil

    # The scope of the validation finding, identifying the specific resource affected.
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

    def validate! : Nil
      if value = @scope
        value.validate!
      end
    end

    def_equals_and_hash(@type, @code, @message, @provider_message, @scope)
  end
end
