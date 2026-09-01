private alias AEB = Amazonite::EventBridge
private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class UpdateApiDestinationResponse
    include JSON::Serializable

    # The ARN of the API destination that was updated.
    @[JSON::Field(key: "ApiDestinationArn")]
    property api_destination_arn : String | Nil

    # The state of the API destination that was updated.
    @[JSON::Field(key: "ApiDestinationState", converter: AEB::ApiDestinationState)]
    property api_destination_state : ApiDestinationState | Nil

    # A time stamp for the time that the API destination was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    # A time stamp for the time that the API destination was last modified.
    @[JSON::Field(key: "LastModifiedTime", converter: Core::AWSEpochConverter)]
    property last_modified_time : Time | Nil

    def initialize(
      @api_destination_arn : String | Nil = nil,
      @api_destination_state : ApiDestinationState | Nil = nil,
      @creation_time : Time | Nil = nil,
      @last_modified_time : Time | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @api_destination_arn
        raise Core::ValidationError.new("ApiDestinationArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ApiDestinationArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("ApiDestinationArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:api-destination\\/[\\.\\-_A-Za-z0-9]+\\/[\\-A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@api_destination_arn, @api_destination_state, @creation_time, @last_modified_time)
  end
end
