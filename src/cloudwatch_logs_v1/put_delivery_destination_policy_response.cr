private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class PutDeliveryDestinationPolicyResponse
    include JSON::Serializable

    # The contents of the policy that you just created.
    @[JSON::Field(key: "policy")]
    property policy : Policy | Nil

    def initialize(
      @policy : Policy | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @policy
        value.validate!
      end
    end

    def_equals_and_hash(@policy)
  end
end
