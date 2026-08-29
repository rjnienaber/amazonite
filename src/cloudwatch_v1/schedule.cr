module Amazonite::CloudWatchV1
  class Schedule
    include JSON::Serializable

    @[JSON::Field(key: "Expression")]
    property expression : String

    @[JSON::Field(key: "Duration")]
    property duration : String

    @[JSON::Field(key: "Timezone")]
    property timezone : String | Nil

    def initialize(
      @expression : String,
      @duration : String,
      @timezone : String | Nil = nil,
    )
    end
  end
end
