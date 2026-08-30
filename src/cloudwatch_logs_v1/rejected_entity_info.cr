private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # If an entity is rejected when a `PutLogEvents` request was made, this includes details about the
  # reason for the rejection.
  class RejectedEntityInfo
    include JSON::Serializable

    # The type of error that caused the rejection of the entity when calling `PutLogEvents`.
    @[JSON::Field(key: "errorType", converter: ACWL::EntityRejectionErrorType)]
    property error_type : EntityRejectionErrorType

    def initialize(
      @error_type : EntityRejectionErrorType,
    )
    end
  end
end
