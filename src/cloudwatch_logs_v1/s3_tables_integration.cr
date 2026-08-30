private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @datasource_name
        raise Core::ValidationError.new("datasourceName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("datasourceName length must be <= 256") if value.size > 256
      end

      if value = @datasource_type
        raise Core::ValidationError.new("datasourceType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("datasourceType length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@datasource_name, @datasource_type)
  end
end
