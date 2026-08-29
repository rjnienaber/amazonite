private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GrantListEntry
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "GrantId")]
    property grant_id : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "CreationDate", converter: Core::AWSEpochConverter)]
    property creation_date : Time | Nil

    @[JSON::Field(key: "GranteePrincipal")]
    property grantee_principal : String | Nil

    @[JSON::Field(key: "RetiringPrincipal")]
    property retiring_principal : String | Nil

    @[JSON::Field(key: "IssuingAccount")]
    property issuing_account : String | Nil

    @[JSON::Field(key: "Operations")]
    property operations : Array(GrantOperation) | Nil

    @[JSON::Field(key: "Constraints")]
    property constraints : GrantConstraints | Nil

    @[JSON::Field(key: "GranteeServicePrincipal")]
    property grantee_service_principal : String | Nil

    @[JSON::Field(key: "RetiringServicePrincipal")]
    property retiring_service_principal : String | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @grant_id : String | Nil = nil,
      @name : String | Nil = nil,
      @creation_date : Time | Nil = nil,
      @grantee_principal : String | Nil = nil,
      @retiring_principal : String | Nil = nil,
      @issuing_account : String | Nil = nil,
      @operations : Array(GrantOperation) | Nil = nil,
      @constraints : GrantConstraints | Nil = nil,
      @grantee_service_principal : String | Nil = nil,
      @retiring_service_principal : String | Nil = nil,
    )
    end
  end
end
