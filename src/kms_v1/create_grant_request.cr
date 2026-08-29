private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class CreateGrantRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "GranteePrincipal")]
    property grantee_principal : String | Nil

    @[JSON::Field(key: "RetiringPrincipal")]
    property retiring_principal : String | Nil

    @[JSON::Field(key: "Operations", converter: Core::ArrayConverter(AK::GrantOperation))]
    property operations : Array(GrantOperation) = [] of GrantOperation

    @[JSON::Field(key: "Constraints")]
    property constraints : GrantConstraints | Nil

    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    @[JSON::Field(key: "GranteeServicePrincipal")]
    property grantee_service_principal : String | Nil

    @[JSON::Field(key: "RetiringServicePrincipal")]
    property retiring_service_principal : String | Nil

    def initialize(
      @key_id : String,
      @operations : Array(GrantOperation),
      @grantee_principal : String | Nil = nil,
      @retiring_principal : String | Nil = nil,
      @constraints : GrantConstraints | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @name : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @grantee_service_principal : String | Nil = nil,
      @retiring_service_principal : String | Nil = nil,
    )
    end
  end
end
