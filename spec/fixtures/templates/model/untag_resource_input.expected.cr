module Amazonite::BackupGatewayV2
  class UntagResourceInput
    include JSON::Serializable

    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String)

    def initialize(
      @resource_arn : String,
      @tag_keys : Array(String)
    )
    end
  end
end
