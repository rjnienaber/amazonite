module Amazonite::SsmV1
  class PutInventoryResult
    include JSON::Serializable

    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @message : String | Nil = nil
    )
    end
  end
end
