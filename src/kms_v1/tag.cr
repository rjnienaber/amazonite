private alias Core = Amazonite::Core

module Amazonite::KmsV1
  # A key-value pair. A tag consists of a tag key and a tag value. Tag keys and tag values are both
  # required, but tag values can be empty (null) strings.
  #
  # Do not include confidential or sensitive information in this field. This field may be displayed
  # in plaintext in CloudTrail logs and other output.
  #
  # For information about the rules that apply to tag keys and tag values, see [User-Defined Tag
  # Restrictions](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html)
  # in the *Amazon Web Services Billing and Cost Management User Guide*.
  class Tag
    include JSON::Serializable

    # The key of the tag.
    @[JSON::Field(key: "TagKey")]
    property tag_key : String

    # The value of the tag.
    @[JSON::Field(key: "TagValue")]
    property tag_value : String

    def initialize(
      @tag_key : String,
      @tag_value : String,
    )
    end

    def validate! : Nil
      if value = @tag_key
        raise Core::ValidationError.new("TagKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TagKey length must be <= 128") if value.size > 128
      end

      if value = @tag_value
        raise Core::ValidationError.new("TagValue length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TagValue length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@tag_key, @tag_value)
  end
end
