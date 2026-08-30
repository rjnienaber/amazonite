private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @log_field_name
        raise Core::ValidationError.new("logFieldName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logFieldName length must be <= 256") if value.size > 256
      end

      if value = @log_field_type
        value.validate!
      end
    end

    def_equals_and_hash(@log_field_name, @log_field_type)
  end
end
