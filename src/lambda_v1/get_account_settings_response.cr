module Amazonite::LambdaV1
  class GetAccountSettingsResponse
    include JSON::Serializable

    @[JSON::Field(key: "AccountLimit")]
    property account_limit : AccountLimit | Nil

    @[JSON::Field(key: "AccountUsage")]
    property account_usage : AccountUsage | Nil

    def initialize(
      @account_limit : AccountLimit | Nil = nil,
      @account_usage : AccountUsage | Nil = nil,
    )
    end
  end
end
