module Amazonite::BackupGatewayV2
  class UntagResourceInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the resource from which to remove tags.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    # The list of tag keys specifying which tags to remove.
    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @resource_arn : String,
      @tag_keys : Array(String),
    )
    end
  end
end
