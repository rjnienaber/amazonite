module Amazonite::SecretsManagerV1
  class ListSecretsResponse
    include JSON::Serializable

    @[JSON::Field(key: "SecretList")]
    property secret_list : Array(SecretListEntry) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @secret_list : Array(SecretListEntry) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
