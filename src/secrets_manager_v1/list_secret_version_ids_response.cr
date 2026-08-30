module Amazonite::SecretsManagerV1
  class ListSecretVersionIdsResponse
    include JSON::Serializable

    # A list of the versions of the secret.
    @[JSON::Field(key: "Versions")]
    property versions : Array(SecretVersionsListEntry) | Nil

    # Secrets Manager includes this value if there's more output available than what is included in
    # the current response. This can occur even when the response includes no values at all, such as
    # when you ask for a filtered view of a long list. To get the next results, call
    # `ListSecretVersionIds` again with this value.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The ARN of the secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the secret.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @versions : Array(SecretVersionsListEntry) | Nil = nil,
      @next_token : String | Nil = nil,
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@versions, @next_token, @arn, @name)
  end
end
