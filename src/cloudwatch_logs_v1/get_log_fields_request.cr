module Amazonite::CloudWatchLogsV1
  class GetLogFieldsRequest
    include JSON::Serializable

    # The name of the data source to retrieve log fields for.
    @[JSON::Field(key: "dataSourceName")]
    property data_source_name : String

    # The type of the data source to retrieve log fields for.
    @[JSON::Field(key: "dataSourceType")]
    property data_source_type : String

    def initialize(
      @data_source_name : String,
      @data_source_type : String,
    )
    end
  end
end
