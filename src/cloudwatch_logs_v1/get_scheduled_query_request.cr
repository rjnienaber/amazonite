module Amazonite::CloudWatchLogsV1
  class GetScheduledQueryRequest
    include JSON::Serializable

    # The ARN or name of the scheduled query to retrieve.
    @[JSON::Field(key: "identifier")]
    property identifier : String

    def initialize(
      @identifier : String,
    )
    end

    def_equals_and_hash(@identifier)
  end
end
