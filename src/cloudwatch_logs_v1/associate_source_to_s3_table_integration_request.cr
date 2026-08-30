module Amazonite::CloudWatchLogsV1
  class AssociateSourceToS3TableIntegrationRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the S3 Table Integration to associate the data source with.
    @[JSON::Field(key: "integrationArn")]
    property integration_arn : String

    # The data source to associate with the S3 Table Integration. Contains the name and type of the
    # data source.
    @[JSON::Field(key: "dataSource")]
    property data_source : DataSource

    def initialize(
      @integration_arn : String,
      @data_source : DataSource,
    )
    end

    def_equals_and_hash(@integration_arn, @data_source)
  end
end
