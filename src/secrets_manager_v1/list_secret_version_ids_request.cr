module Amazonite::SecretsManagerV1
  class ListSecretVersionIdsRequest
    include JSON::Serializable

    # The ARN or name of the secret whose versions you want to list.
    #
    # For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See [Finding
    # a secret from a partial
    # ARN](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen).
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # The number of results to include in the response.
    #
    # If there are more results available, in the response, Secrets Manager includes `NextToken`. To
    # get the next results, call `ListSecretVersionIds` again with the value from `NextToken`.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # A token that indicates where the output should continue from, if a previous call did not show
    # all results. To get the next results, call `ListSecretVersionIds` again with this value.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # Specifies whether to include versions of secrets that don't have any staging labels attached to
    # them. Versions without staging labels are considered deprecated and are subject to deletion by
    # Secrets Manager. By default, versions without staging labels aren't included.
    @[JSON::Field(key: "IncludeDeprecated")]
    property include_deprecated : Bool | Nil

    def initialize(
      @secret_id : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @include_deprecated : Bool | Nil = nil,
    )
    end
  end
end
