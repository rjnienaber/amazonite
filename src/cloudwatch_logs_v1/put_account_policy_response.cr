module Amazonite::CloudWatchLogsV1
  class PutAccountPolicyResponse
    include JSON::Serializable

    # The account policy that you created.
    @[JSON::Field(key: "accountPolicy")]
    property account_policy : AccountPolicy | Nil

    def initialize(
      @account_policy : AccountPolicy | Nil = nil,
    )
    end
  end
end
