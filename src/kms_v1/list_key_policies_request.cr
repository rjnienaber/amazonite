module Amazonite::KmsV1
  class ListKeyPoliciesRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "Marker")]
    property marker : String | Nil

    def initialize(
      @key_id : String,
      @limit : Int32 | Nil = nil,
      @marker : String | Nil = nil,
    )
    end
  end
end
