private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class CreateApiDestinationResponse
    include JSON::Serializable

    # The ARN of the API destination that was created by the request.
    @[JSON::Field(key: "ApiDestinationArn")]
    property api_destination_arn : String | Nil

    # The state of the API destination that was created by the request.
    @[JSON::Field(key: "ApiDestinationState", converter: AEB::ApiDestinationState)]
    property api_destination_state : ApiDestinationState | Nil

    # A time stamp indicating the time that the API destination was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    # A time stamp indicating the time that the API destination was last modified.
    @[JSON::Field(key: "LastModifiedTime", converter: Core::AWSEpochConverter)]
    property last_modified_time : Time | Nil

    def initialize(
      @api_destination_arn : String | Nil = nil,
      @api_destination_state : ApiDestinationState | Nil = nil,
      @creation_time : Time | Nil = nil,
      @last_modified_time : Time | Nil = nil,
    )
    end
  end
end
