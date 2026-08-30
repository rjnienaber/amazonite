module Amazonite::LambdaV1
  class GetAccountSettingsResponse
    include JSON::Serializable

    # Limits that are related to concurrency and code storage.
    @[JSON::Field(key: "AccountLimit")]
    property account_limit : AccountLimit | Nil

    # The number of functions and amount of storage in use.
    @[JSON::Field(key: "AccountUsage")]
    property account_usage : AccountUsage | Nil

    def initialize(
      @account_limit : AccountLimit | Nil = nil,
      @account_usage : AccountUsage | Nil = nil,
    )
    end

    def_equals_and_hash(@account_limit, @account_usage)
  end
end
