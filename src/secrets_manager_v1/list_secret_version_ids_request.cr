module Amazonite::SecretsManagerV1
  class ListSecretVersionIdsRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

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
