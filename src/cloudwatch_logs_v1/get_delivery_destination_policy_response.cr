module Amazonite::CloudWatchLogsV1
  class GetDeliveryDestinationPolicyResponse
    include JSON::Serializable

    # The IAM policy for this delivery destination.
    @[JSON::Field(key: "policy")]
    property policy : Policy | Nil

    def initialize(
      @policy : Policy | Nil = nil,
    )
    end

    def_equals_and_hash(@policy)
  end
end
