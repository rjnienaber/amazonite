module Amazonite::SecretsManagerV1
  class BatchGetSecretValueRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretIdList")]
    property secret_id_list : Array(String) | Nil

    @[JSON::Field(key: "Filters")]
    property filters : Array(Filter) | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @secret_id_list : Array(String) | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
