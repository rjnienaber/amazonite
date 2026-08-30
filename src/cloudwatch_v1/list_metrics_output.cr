module Amazonite::CloudWatchV1
  class ListMetricsOutput
    include JSON::Serializable

    # The metrics that match your request.
    @[JSON::Field(key: "Metrics")]
    property metrics : Array(Metric) | Nil

    # The token that marks the start of the next batch of returned results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # If you are using this operation in a monitoring account, this array contains the account IDs of
    # the source accounts where the metrics in the returned data are from.
    #
    # This field is a 1:1 mapping between each metric that is returned and the ID of the owning
    # account.
    @[JSON::Field(key: "OwningAccounts")]
    property owning_accounts : Array(String) | Nil

    def initialize(
      @metrics : Array(Metric) | Nil = nil,
      @next_token : String | Nil = nil,
      @owning_accounts : Array(String) | Nil = nil,
    )
    end

    def_equals_and_hash(@metrics, @next_token, @owning_accounts)
  end
end
