private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a single DynamoDB
  # table.
  #
  # Amazon Web Services-assigned tag names and values are automatically assigned the `aws:` prefix,
  # which the user cannot assign. Amazon Web Services-assigned tag names do not count towards the
  # tag limit of 50. User-assigned tag names have the prefix `user:` in the Cost Allocation Report.
  # You cannot backdate the application of a tag.
  #
  # For an overview on tagging DynamoDB resources, see [Tagging for
  # DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html) in the
  # *Amazon DynamoDB Developer Guide*.
  class Tag
    include JSON::Serializable

    # The key of the tag. Tag keys are case sensitive. Each DynamoDB table can only have up to one tag
    # with the same key. If you try to add an existing tag (same key), the existing tag value will be
    # updated to the new value.
    @[JSON::Field(key: "Key")]
    property key : String

    # The value of the tag. Tag values are case-sensitive and can be null.
    @[JSON::Field(key: "Value")]
    property value : String

    def initialize(
      @key : String,
      @value : String,
    )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 128") if value.size > 128
      end

      if value = @value
        raise Core::ValidationError.new("Value length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Value length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@key, @value)
  end
end
