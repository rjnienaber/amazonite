module Amazonite::SsmV1
  class DescribeActivationsResult
    include JSON::Serializable

    @[JSON::Field(key: "ActivationList")]
    property activation_list : Array(Activation) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @activation_list : Array(Activation) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
