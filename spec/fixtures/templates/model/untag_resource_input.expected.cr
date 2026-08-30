private alias Core = Amazonite::Core

module Amazonite::BackupGateway
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

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceARN length must be >= 50") if value.size < 50
        raise Core::ValidationError.new("ResourceARN length must be <= 500") if value.size > 500
        raise Core::ValidationError.new("ResourceARN does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws|aws-cn|aws-us-gov):backup-gateway(:[a-zA-Z-0-9]+){3}\\/[a-zA-Z-0-9]+$"))
      end
    end

    def_equals_and_hash(@resource_arn, @tag_keys)
  end
end
