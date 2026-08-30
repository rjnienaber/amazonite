module Amazonite::CloudWatchLogsV1
  class DisassociateSourceFromS3TableIntegrationRequest
    include JSON::Serializable

    # The unique identifier of the association to remove between the data source and S3 Table
    # Integration.
    @[JSON::Field(key: "identifier")]
    property identifier : String

    def initialize(
      @identifier : String,
    )
    end
  end
end
