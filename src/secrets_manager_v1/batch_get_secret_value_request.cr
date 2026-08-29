module Amazonite::SecretsManagerV1
  class BatchGetSecretValueRequest
    include JSON::Serializable

    # The ARN or names of the secrets to retrieve. You must include `Filters` or `SecretIdList`, but
    # not both.
    @[JSON::Field(key: "SecretIdList")]
    property secret_id_list : Array(String) | Nil

    # The filters to choose which secrets to retrieve. You must include `Filters` or `SecretIdList`,
    # but not both.
    @[JSON::Field(key: "Filters")]
    property filters : Array(Filter) | Nil

    # The number of results to include in the response.
    #
    # If there are more results available, in the response, Secrets Manager includes `NextToken`. To
    # get the next results, call `BatchGetSecretValue` again with the value from `NextToken`. To use
    # this parameter, you must also use the `Filters` parameter.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # A token that indicates where the output should continue from, if a previous call did not show
    # all results. To get the next results, call `BatchGetSecretValue` again with this value.
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
