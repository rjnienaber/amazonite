module Amazonite::SsmV1
  class DeleteOpsMetadataRequest
    include JSON::Serializable

    @[JSON::Field(key: "OpsMetadataArn")]
    property ops_metadata_arn : String

    def initialize(
      @ops_metadata_arn : String
    )
    end
  end
end
