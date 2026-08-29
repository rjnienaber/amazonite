module Amazonite::KmsV1
  class MultiRegionKey
    include JSON::Serializable

    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    @[JSON::Field(key: "Region")]
    property region : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @region : String | Nil = nil,
    )
    end
  end
end
