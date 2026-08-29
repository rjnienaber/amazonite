module Amazonite::CloudWatchV1
  class MessageData
    include JSON::Serializable

    @[JSON::Field(key: "Code")]
    property code : String | Nil

    @[JSON::Field(key: "Value")]
    property value : String | Nil

    def initialize(
      @code : String | Nil = nil,
      @value : String | Nil = nil,
    )
    end
  end
end
