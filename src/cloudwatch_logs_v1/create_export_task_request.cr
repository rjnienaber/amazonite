private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class CreateExportTaskRequest
    include JSON::Serializable

    # The name of the export task.
    @[JSON::Field(key: "taskName")]
    property task_name : String | Nil

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    # Export only log streams that match the provided prefix. If you don't specify a value, no prefix
    # filter is applied.
    @[JSON::Field(key: "logStreamNamePrefix")]
    property log_stream_name_prefix : String | Nil

    # The start time of the range for the request, expressed as the number of milliseconds after `Jan
    # 1, 1970 00:00:00 UTC`. Events with a timestamp earlier than this time are not exported.
    @[JSON::Field(key: "from")]
    property from : Int64

    # The end time of the range for the request, expressed as the number of milliseconds after `Jan 1,
    # 1970 00:00:00 UTC`. Events with a timestamp later than this time are not exported.
    #
    # You must specify a time that is not earlier than when this log group was created.
    @[JSON::Field(key: "to")]
    property to : Int64

    # The name of S3 bucket for the exported log data. The bucket must be in the same Amazon Web
    # Services Region.
    @[JSON::Field(key: "destination")]
    property destination : String

    # The prefix used as the start of the key for every object exported. If you don't specify a value,
    # the default is `exportedlogs`.
    #
    # The length of this parameter must comply with the S3 object key name length limits. The object
    # key name is a sequence of Unicode characters with UTF-8 encoding, and can be up to 1,024 bytes.
    @[JSON::Field(key: "destinationPrefix")]
    property destination_prefix : String | Nil

    def initialize(
      @log_group_name : String,
      @from : Int64,
      @to : Int64,
      @destination : String,
      @task_name : String | Nil = nil,
      @log_stream_name_prefix : String | Nil = nil,
      @destination_prefix : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @task_name
        raise Core::ValidationError.new("taskName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("taskName length must be <= 512") if value.size > 512
      end

      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @log_stream_name_prefix
        raise Core::ValidationError.new("logStreamNamePrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logStreamNamePrefix length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logStreamNamePrefix does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end

      if value = @from
        raise Core::ValidationError.new("from value must be >= 0") if value < 0
      end

      if value = @to
        raise Core::ValidationError.new("to value must be >= 0") if value < 0
      end

      if value = @destination
        raise Core::ValidationError.new("destination length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("destination length must be <= 512") if value.size > 512
      end
    end

    def_equals_and_hash(@task_name, @log_group_name, @log_stream_name_prefix, @from, @to, @destination, @destination_prefix)
  end
end
