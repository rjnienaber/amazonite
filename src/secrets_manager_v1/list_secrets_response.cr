module Amazonite::SecretsManagerV1
  class ListSecretsResponse
    include JSON::Serializable

    # A list of the secrets in the account.
    @[JSON::Field(key: "SecretList")]
    property secret_list : Array(SecretListEntry) | Nil

    # Secrets Manager includes this value if there's more output available than what is included in
    # the current response. This can occur even when the response includes no values at all, such as
    # when you ask for a filtered view of a long list. To get the next results, call `ListSecrets`
    # again with this value.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @secret_list : Array(SecretListEntry) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@secret_list, @next_token)
  end
end
