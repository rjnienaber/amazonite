private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class StartChangeRequestExecutionRequest
    include JSON::Serializable

    @[JSON::Field(key: "ScheduledTime", converter: Core::AWSEpochConverter)]
    property scheduled_time : Time | Nil

    @[JSON::Field(key: "DocumentName")]
    property document_name : String

    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    @[JSON::Field(key: "ChangeRequestName")]
    property change_request_name : String | Nil

    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    @[JSON::Field(key: "AutoApprove")]
    property auto_approve : Bool | Nil

    @[JSON::Field(key: "Runbooks")]
    property runbooks : Array(Runbook)

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "ScheduledEndTime", converter: Core::AWSEpochConverter)]
    property scheduled_end_time : Time | Nil

    @[JSON::Field(key: "ChangeDetails")]
    property change_details : String | Nil

    def initialize(
      @document_name : String,
      @runbooks : Array(Runbook),
      @scheduled_time : Time | Nil = nil,
      @document_version : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
      @change_request_name : String | Nil = nil,
      @client_token : String | Nil = nil,
      @auto_approve : Bool | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @scheduled_end_time : Time | Nil = nil,
      @change_details : String | Nil = nil
    )
    end
  end
end
