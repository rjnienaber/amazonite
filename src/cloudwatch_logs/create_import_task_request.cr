private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class CreateImportTaskRequest
    include JSON::Serializable

    # The ARN of the source to import from.
    @[JSON::Field(key: "importSourceArn")]
    property import_source_arn : String

    # The ARN of the IAM role that grants CloudWatch Logs permission to import from the CloudTrail
    # Lake Event Data Store.
    @[JSON::Field(key: "importRoleArn")]
    property import_role_arn : String

    # Optional filters to constrain the import by CloudTrail event time. Times are specified in Unix
    # timestamp milliseconds. The range of data being imported must be within the specified source's
    # retention period.
    @[JSON::Field(key: "importFilter")]
    property import_filter : ImportFilter | Nil

    def initialize(
      @import_source_arn : String,
      @import_role_arn : String,
      @import_filter : ImportFilter | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @import_role_arn
        raise Core::ValidationError.new("importRoleArn length must be >= 1") if value.size < 1
      end

      if value = @import_filter
        value.validate!
      end
    end

    def_equals_and_hash(@import_source_arn, @import_role_arn, @import_filter)
  end
end
