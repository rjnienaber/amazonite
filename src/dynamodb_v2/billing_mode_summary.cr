private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class BillingModeSummary
    include JSON::Serializable

    @[JSON::Field(key: "BillingMode", converter: ADDB::BillingMode)]
    property billing_mode : BillingMode | Nil

    @[JSON::Field(key: "LastUpdateToPayPerRequestDateTime", converter: AC::AWSEpochConverter)]
    property last_update_to_pay_per_request_date_time : Time | Nil

    def initialize(
      @billing_mode : BillingMode | Nil = nil,
      @last_update_to_pay_per_request_date_time : Time | Nil = nil
    )
    end
  end
end