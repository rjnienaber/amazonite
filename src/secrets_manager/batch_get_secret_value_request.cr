private alias Core = Amazonite::Core

module Amazonite::SecretsManager
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

    def validate! : Nil
      if value = @secret_id_list
        raise Core::ValidationError.new("SecretIdList must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("SecretIdList must have at most 20 item(s)") if value.size > 20
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Filters must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 20") if value > 20
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 4096") if value.size > 4096
      end
    end

    def_equals_and_hash(@secret_id_list, @filters, @max_results, @next_token)
  end
end
