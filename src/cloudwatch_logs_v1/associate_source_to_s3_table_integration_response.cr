module Amazonite::CloudWatchLogsV1
  class AssociateSourceToS3TableIntegrationResponse
    include JSON::Serializable

    # The unique identifier for the association between the data source and S3 Table Integration.
    @[JSON::Field(key: "identifier")]
    property identifier : String | Nil

    def initialize(
      @identifier : String | Nil = nil,
    )
    end

    def_equals_and_hash(@identifier)
  end
end
