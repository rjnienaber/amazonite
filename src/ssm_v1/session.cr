private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class Session
    include JSON::Serializable

    @[JSON::Field(key: "SessionId")]
    property session_id : String | Nil

    @[JSON::Field(key: "Target")]
    property target : String | Nil

    @[JSON::Field(key: "Status", converter: AS::SessionStatus)]
    property status : SessionStatus | Nil

    @[JSON::Field(key: "StartDate", converter: Core::AWSEpochConverter)]
    property start_date : Time | Nil

    @[JSON::Field(key: "EndDate", converter: Core::AWSEpochConverter)]
    property end_date : Time | Nil

    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    @[JSON::Field(key: "Owner")]
    property owner : String | Nil

    @[JSON::Field(key: "Reason")]
    property reason : String | Nil

    @[JSON::Field(key: "Details")]
    property details : String | Nil

    @[JSON::Field(key: "OutputUrl")]
    property output_url : SessionManagerOutputUrl | Nil

    @[JSON::Field(key: "MaxSessionDuration")]
    property max_session_duration : String | Nil

    def initialize(
      @session_id : String | Nil = nil,
      @target : String | Nil = nil,
      @status : SessionStatus | Nil = nil,
      @start_date : Time | Nil = nil,
      @end_date : Time | Nil = nil,
      @document_name : String | Nil = nil,
      @owner : String | Nil = nil,
      @reason : String | Nil = nil,
      @details : String | Nil = nil,
      @output_url : SessionManagerOutputUrl | Nil = nil,
      @max_session_duration : String | Nil = nil
    )
    end
  end
end
