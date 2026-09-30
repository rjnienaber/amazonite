module Amazonite::DynamoDB
  # Overrides the on-demand throughput settings for this replica table. If you don't specify a value
  # for this parameter, it uses the source table's on-demand throughput settings.
  class OnDemandThroughputOverride
    include JSON::Serializable

    # Maximum number of read request units for the specified replica table.
    @[JSON::Field(key: "MaxReadRequestUnits")]
    property max_read_request_units : Int64 | Nil

    def initialize(
      @max_read_request_units : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@max_read_request_units)
  end
end
