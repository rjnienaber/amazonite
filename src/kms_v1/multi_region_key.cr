module Amazonite::KmsV1
  # Describes the primary or replica key in a multi-Region key.
  class MultiRegionKey
    include JSON::Serializable

    # Displays the key ARN of a primary or replica key of a multi-Region key.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    # Displays the Amazon Web Services Region of a primary or replica key in a multi-Region key.
    @[JSON::Field(key: "Region")]
    property region : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @region : String | Nil = nil,
    )
    end
  end
end
