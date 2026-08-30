private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # Represents a data source association with an S3 Table Integration, including its status and
  # metadata.
  class S3TableIntegrationSource
    include JSON::Serializable

    # The unique identifier for this data source association.
    @[JSON::Field(key: "identifier")]
    property identifier : String | Nil

    # The data source associated with the S3 Table Integration.
    @[JSON::Field(key: "dataSource")]
    property data_source : DataSource | Nil

    # The current status of the data source association.
    @[JSON::Field(key: "status", converter: ACWL::S3TableIntegrationSourceStatus)]
    property status : S3TableIntegrationSourceStatus | Nil

    # Additional information about the status of the data source association.
    @[JSON::Field(key: "statusReason")]
    property status_reason : String | Nil

    # The timestamp when the data source association was created.
    @[JSON::Field(key: "createdTimeStamp")]
    property created_time_stamp : Int64 | Nil

    # The identifier of the parent data source for this association.
    @[JSON::Field(key: "parentSourceIdentifier")]
    property parent_source_identifier : String | Nil

    def initialize(
      @identifier : String | Nil = nil,
      @data_source : DataSource | Nil = nil,
      @status : S3TableIntegrationSourceStatus | Nil = nil,
      @status_reason : String | Nil = nil,
      @created_time_stamp : Int64 | Nil = nil,
      @parent_source_identifier : String | Nil = nil,
    )
    end
  end
end
