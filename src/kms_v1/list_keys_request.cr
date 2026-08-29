module Amazonite::KmsV1
  class ListKeysRequest
    include JSON::Serializable

    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "Marker")]
    property marker : String | Nil

    def initialize(
      @limit : Int32 | Nil = nil,
      @marker : String | Nil = nil,
    )
    end
  end
end
