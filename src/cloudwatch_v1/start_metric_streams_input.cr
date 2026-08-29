module Amazonite::CloudWatchV1
  class StartMetricStreamsInput
    include JSON::Serializable

    @[JSON::Field(key: "Names")]
    property names : Array(String) = [] of String

    def initialize(
      @names : Array(String),
    )
    end
  end
end
