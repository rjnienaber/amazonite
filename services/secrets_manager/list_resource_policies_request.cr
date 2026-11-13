private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class ListResourcePoliciesRequest
    include JSON::Serializable

    # The ARN or name of the secret.
    #
    # For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See [Finding
    # a secret from a partial
    # ARN](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen).
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # The number of results to include in the response. If you don't specify this value, the service
    # returns up to 100 results.
    #
    # If there are more results available, in the response, Secrets Manager includes `NextToken`. To
    # get the next results, call `ListResourcePolicies` again with the value from `NextToken`.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # A token that indicates where the output should continue from, if a previous call did not show
    # all results. To get the next results, call `ListResourcePolicies` again with this value.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @secret_id : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @secret_id
        raise Core::ValidationError.new("SecretId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretId length must be <= 2048") if value.size > 2048
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 4096") if value.size > 4096
      end
    end

    def_equals_and_hash(@secret_id, @max_results, @next_token)
  end
end
