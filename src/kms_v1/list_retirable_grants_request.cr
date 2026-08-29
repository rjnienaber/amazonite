module Amazonite::KmsV1
  class ListRetirableGrantsRequest
    include JSON::Serializable

    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "Marker")]
    property marker : String | Nil

    @[JSON::Field(key: "RetiringPrincipal")]
    property retiring_principal : String | Nil

    @[JSON::Field(key: "RetiringServicePrincipal")]
    property retiring_service_principal : String | Nil

    def initialize(
      @limit : Int32 | Nil = nil,
      @marker : String | Nil = nil,
      @retiring_principal : String | Nil = nil,
      @retiring_service_principal : String | Nil = nil,
    )
    end
  end
end
