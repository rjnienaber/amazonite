private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class PutResourcePolicyResponse
    include JSON::Serializable

    # The ARN of the secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the secret.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The name of the resource policy. If you didn't specify `PolicyName` in the request, this is
    # `default`.
    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @policy_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("ARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ARN length must be <= 2048") if value.size > 2048
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 512") if value.size > 512
      end

      if value = @policy_name
        raise Core::ValidationError.new("PolicyName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("PolicyName does not match the required pattern") unless value.matches?(Regex.new("^[0-9A-Za-z\\-\\_]+$"))
      end
    end

    def_equals_and_hash(@arn, @name, @policy_name)
  end
end
