module Amazonite::CloudWatchLogsV1
  class DeleteScheduledQueryRequest
    include JSON::Serializable

    # The ARN or name of the scheduled query to delete.
    @[JSON::Field(key: "identifier")]
    property identifier : String

    def initialize(
      @identifier : String,
    )
    end
  end
end
