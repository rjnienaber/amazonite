module Amazonite::SecretsManagerV1
  class ListSecretVersionIdsResponse
    include JSON::Serializable

    @[JSON::Field(key: "Versions")]
    property versions : Array(SecretVersionsListEntry) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @versions : Array(SecretVersionsListEntry) | Nil = nil,
      @next_token : String | Nil = nil,
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end
  end
end
