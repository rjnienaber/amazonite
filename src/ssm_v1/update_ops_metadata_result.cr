module Amazonite::SsmV1
  class UpdateOpsMetadataResult
    include JSON::Serializable

    @[JSON::Field(key: "OpsMetadataArn")]
    property ops_metadata_arn : String | Nil

    def initialize(
      @ops_metadata_arn : String | Nil = nil
    )
    end
  end
end
