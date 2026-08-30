module Amazonite::DynamoDBV2
  # Sets the maximum number of read and write units for the specified on-demand table. If you use
  # this parameter, you must specify `MaxReadRequestUnits`, `MaxWriteRequestUnits`, or both.
  class OnDemandThroughput
    include JSON::Serializable

    # Maximum number of read request units for the specified table.
    #
    # To specify a maximum `OnDemandThroughput` on your table, set the value of `MaxReadRequestUnits`
    # as greater than or equal to 1. To remove the maximum `OnDemandThroughput` that is currently set
    # on your table, set the value of `MaxReadRequestUnits` to -1.
    @[JSON::Field(key: "MaxReadRequestUnits")]
    property max_read_request_units : Int64 | Nil

    # Maximum number of write request units for the specified table.
    #
    # To specify a maximum `OnDemandThroughput` on your table, set the value of `MaxWriteRequestUnits`
    # as greater than or equal to 1. To remove the maximum `OnDemandThroughput` that is currently set
    # on your table, set the value of `MaxWriteRequestUnits` to -1.
    @[JSON::Field(key: "MaxWriteRequestUnits")]
    property max_write_request_units : Int64 | Nil

    def initialize(
      @max_read_request_units : Int64 | Nil = nil,
      @max_write_request_units : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@max_read_request_units, @max_write_request_units)
  end
end
