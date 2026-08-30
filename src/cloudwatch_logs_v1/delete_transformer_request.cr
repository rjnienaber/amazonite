module Amazonite::CloudWatchLogsV1
  class DeleteTransformerRequest
    include JSON::Serializable

    # Specify either the name or ARN of the log group to delete the transformer for. If the log group
    # is in a source account and you are using a monitoring account, you must use the log group ARN.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String

    def initialize(
      @log_group_identifier : String,
    )
    end

    def_equals_and_hash(@log_group_identifier)
  end
end
