module Amazonite::SsmV1
  class DescribeActivationsResult
    include JSON::Serializable

    # A list of activations for your Amazon Web Services account.
    @[JSON::Field(key: "ActivationList")]
    property activation_list : Array(Activation) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @activation_list : Array(Activation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@activation_list, @next_token)
  end
end
