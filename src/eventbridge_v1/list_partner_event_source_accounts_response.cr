private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class ListPartnerEventSourceAccountsResponse
    include JSON::Serializable

    # The list of partner event sources returned by the operation.
    @[JSON::Field(key: "PartnerEventSourceAccounts")]
    property partner_event_source_accounts : Array(PartnerEventSourceAccount) | Nil

    # A token indicating there are more results available. If there are no more results, no token is
    # included in the response.
    #
    # The value of `nextToken` is a unique pagination token for each page. To retrieve the next page
    # of results, make the call again using the returned token. Keep all other arguments unchanged.
    #
    # Using an expired pagination token results in an `HTTP 400 InvalidToken` error.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @partner_event_source_accounts : Array(PartnerEventSourceAccount) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @partner_event_source_accounts
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@partner_event_source_accounts, @next_token)
  end
end
