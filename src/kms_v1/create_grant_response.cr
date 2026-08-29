module Amazonite::KmsV1
  class CreateGrantResponse
    include JSON::Serializable

    @[JSON::Field(key: "GrantToken")]
    property grant_token : String | Nil

    @[JSON::Field(key: "GrantId")]
    property grant_id : String | Nil

    def initialize(
      @grant_token : String | Nil = nil,
      @grant_id : String | Nil = nil,
    )
    end
  end
end
