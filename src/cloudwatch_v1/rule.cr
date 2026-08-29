module Amazonite::CloudWatchV1
  class Rule
    include JSON::Serializable

    @[JSON::Field(key: "Schedule")]
    property schedule : Schedule

    def initialize(
      @schedule : Schedule,
    )
    end
  end
end
