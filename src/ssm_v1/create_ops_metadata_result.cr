module Amazonite::SsmV1
  class CreateOpsMetadataResult
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the OpsMetadata Object or blob created by the call.
    @[JSON::Field(key: "OpsMetadataArn")]
    property ops_metadata_arn : String | Nil

    def initialize(
      @ops_metadata_arn : String | Nil = nil,
    )
    end
  end
end
