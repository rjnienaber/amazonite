module Amazonite::CloudWatchLogsV1
  # Defines the data type structure for a log field, including the type, element information, and
  # nested fields for complex types.
  class LogFieldType
    include JSON::Serializable

    # The data type of the log field.
    @[JSON::Field(key: "type")]
    property type : String | Nil

    # For array or collection types, specifies the element type information.
    @[JSON::Field(key: "element")]
    property element : LogFieldType | Nil

    # For complex types, contains the nested field definitions.
    @[JSON::Field(key: "fields")]
    property fields : Array(LogFieldsListItem) | Nil

    def initialize(
      @type : String | Nil = nil,
      @element : LogFieldType | Nil = nil,
      @fields : Array(LogFieldsListItem) | Nil = nil,
    )
    end

    def_equals_and_hash(@type, @element, @fields)
  end
end
