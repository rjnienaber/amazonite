module Amazonite::CloudWatchLogsV1
  # Represents a data source that categorizes logs by originating service and log type, providing
  # service-based organization complementing traditional log groups.
  class DataSource
    include JSON::Serializable

    # The name of the data source.
    @[JSON::Field(key: "name")]
    property name : String

    # The type of the data source.
    @[JSON::Field(key: "type")]
    property type : String | Nil

    def initialize(
      @name : String,
      @type : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@name, @type)
  end
end
