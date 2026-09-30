private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class PutAccountPolicyResponse
    include JSON::Serializable

    # The account policy that you created.
    @[JSON::Field(key: "accountPolicy")]
    property account_policy : AccountPolicy | Nil

    def initialize(
      @account_policy : AccountPolicy | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @account_policy
        value.validate!
      end
    end

    def_equals_and_hash(@account_policy)
  end
end
