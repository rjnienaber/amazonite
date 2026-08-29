module Amazonite::CloudWatchV1
  class LabelOptions
    include JSON::Serializable

    @[JSON::Field(key: "Timezone")]
    property timezone : String | Nil

    def initialize(
      @timezone : String | Nil = nil,
    )
    end
  end
end
