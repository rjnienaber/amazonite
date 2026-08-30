private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # Information about a destination where scheduled query results are processed, including
  # processing status and any error messages.
  class ScheduledQueryDestination
    include JSON::Serializable

    # The type of destination for query results.
    @[JSON::Field(key: "destinationType", converter: ACWL::ScheduledQueryDestinationType)]
    property destination_type : ScheduledQueryDestinationType | Nil

    # The identifier for the destination where results are delivered.
    @[JSON::Field(key: "destinationIdentifier")]
    property destination_identifier : String | Nil

    # The processing status of the destination delivery.
    @[JSON::Field(key: "status", converter: ACWL::ActionStatus)]
    property status : ActionStatus | Nil

    # The identifier of the processed result at the destination.
    @[JSON::Field(key: "processedIdentifier")]
    property processed_identifier : String | Nil

    # Error message if destination processing failed.
    @[JSON::Field(key: "errorMessage")]
    property error_message : String | Nil

    def initialize(
      @destination_type : ScheduledQueryDestinationType | Nil = nil,
      @destination_identifier : String | Nil = nil,
      @status : ActionStatus | Nil = nil,
      @processed_identifier : String | Nil = nil,
      @error_message : String | Nil = nil,
    )
    end
  end
end
