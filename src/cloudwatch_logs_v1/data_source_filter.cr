module Amazonite::CloudWatchLogsV1
  # Filter criteria for data sources, used to specify which data sources to include in operations
  # based on name and type.
  class DataSourceFilter
    include JSON::Serializable

    # The name pattern to filter data sources by.
    @[JSON::Field(key: "name")]
    property name : String

    # The type pattern to filter data sources by.
    @[JSON::Field(key: "type")]
    property type : String | Nil

    def initialize(
      @name : String,
      @type : String | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @type)
  end
end
