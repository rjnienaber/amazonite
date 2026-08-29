module Amazonite::KmsV1
  class ListGrantsRequest
    include JSON::Serializable

    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "Marker")]
    property marker : String | Nil

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "GrantId")]
    property grant_id : String | Nil

    @[JSON::Field(key: "GranteePrincipal")]
    property grantee_principal : String | Nil

    @[JSON::Field(key: "GranteeServicePrincipal")]
    property grantee_service_principal : String | Nil

    def initialize(
      @key_id : String,
      @limit : Int32 | Nil = nil,
      @marker : String | Nil = nil,
      @grant_id : String | Nil = nil,
      @grantee_principal : String | Nil = nil,
      @grantee_service_principal : String | Nil = nil,
    )
    end
  end
end
