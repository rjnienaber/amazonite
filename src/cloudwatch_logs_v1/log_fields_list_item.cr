module Amazonite::CloudWatchLogsV1
  # Represents a log field with its name and data type information for a specific data source.
  class LogFieldsListItem
    include JSON::Serializable

    # The name of the log field.
    @[JSON::Field(key: "logFieldName")]
    property log_field_name : String | Nil

    # The data type information for the log field.
    @[JSON::Field(key: "logFieldType")]
    property log_field_type : LogFieldType | Nil

    def initialize(
      @log_field_name : String | Nil = nil,
      @log_field_type : LogFieldType | Nil = nil,
    )
    end

    def_equals_and_hash(@log_field_name, @log_field_type)
  end
end
