private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class BillingModeSummary
    include JSON::Serializable

    @[JSON::Field(key: "BillingMode", converter: ADDB::BillingMode)]
    property billing_mode : BillingMode | Nil

    @[JSON::Field(key: "LastUpdateToPayPerRequestDateTime", converter: Core::AWSEpochConverter)]
    property last_update_to_pay_per_request_date_time : Time | Nil

    def initialize(
      @billing_mode : BillingMode | Nil = nil,
      @last_update_to_pay_per_request_date_time : Time | Nil = nil
    )
    end
  end
end
