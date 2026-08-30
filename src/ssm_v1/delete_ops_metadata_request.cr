module Amazonite::SsmV1
  class DeleteOpsMetadataRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of an OpsMetadata Object to delete.
    @[JSON::Field(key: "OpsMetadataArn")]
    property ops_metadata_arn : String

    def initialize(
      @ops_metadata_arn : String,
    )
    end

    def_equals_and_hash(@ops_metadata_arn)
  end
end
