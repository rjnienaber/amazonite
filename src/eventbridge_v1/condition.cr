module Amazonite::EventBridgeV1
  # A JSON string which you can use to limit the event bus permissions you are granting to only
  # accounts that fulfill the condition. Currently, the only supported condition is membership in a
  # certain Amazon Web Services organization. The string must contain `Type`, `Key`, and `Value`
  # fields. The `Value` field specifies the ID of the Amazon Web Services organization. Following is
  # an example value for `Condition`:
  #
  # `'{"Type" : "StringEquals", "Key": "aws:PrincipalOrgID", "Value": "o-1234567890"}'`
  class Condition
    include JSON::Serializable

    # Specifies the type of condition. Currently the only supported value is `StringEquals`.
    @[JSON::Field(key: "Type")]
    property type : String

    # Specifies the key for the condition. Currently the only supported key is `aws:PrincipalOrgID`.
    @[JSON::Field(key: "Key")]
    property key : String

    # Specifies the value for the key. Currently, this must be the ID of the organization.
    @[JSON::Field(key: "Value")]
    property value : String

    def initialize(
      @type : String,
      @key : String,
      @value : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@type, @key, @value)
  end
end
