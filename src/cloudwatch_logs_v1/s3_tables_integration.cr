module Amazonite::CloudWatchLogsV1
  # Contains information about the S3 Tables integration configuration for a configuration template.
  class S3TablesIntegration
    include JSON::Serializable

    # The name of the S3 Tables datasource.
    @[JSON::Field(key: "datasourceName")]
    property datasource_name : String | Nil

    # The type of the S3 Tables datasource.
    @[JSON::Field(key: "datasourceType")]
    property datasource_type : String | Nil

    def initialize(
      @datasource_name : String | Nil = nil,
      @datasource_type : String | Nil = nil,
    )
    end

    def_equals_and_hash(@datasource_name, @datasource_type)
  end
end
