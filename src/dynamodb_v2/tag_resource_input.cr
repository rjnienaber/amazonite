private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class TagResourceInput
    include JSON::Serializable

    # Identifies the Amazon DynamoDB resource to which tags should be added. This value is an Amazon
    # Resource Name (ARN).
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    # The tags to be assigned to the Amazon DynamoDB resource.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @resource_arn : String,
      @tags : Array(Tag),
    )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@resource_arn, @tags)
  end
end
