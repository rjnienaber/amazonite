private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Information about a Session Manager connection to a managed node.
  class Session
    include JSON::Serializable

    # The ID of the session.
    @[JSON::Field(key: "SessionId")]
    property session_id : String | Nil

    # The managed node that the Session Manager session connected to.
    @[JSON::Field(key: "Target")]
    property target : String | Nil

    # The status of the session. For example, "Connected" or "Terminated".
    @[JSON::Field(key: "Status", converter: AS::SessionStatus)]
    property status : SessionStatus | Nil

    # The date and time, in ISO-8601 Extended format, when the session began.
    @[JSON::Field(key: "StartDate", converter: Core::AWSEpochConverter)]
    property start_date : Time | Nil

    # The date and time, in ISO-8601 Extended format, when the session was terminated.
    @[JSON::Field(key: "EndDate", converter: Core::AWSEpochConverter)]
    property end_date : Time | Nil

    # The name of the Session Manager SSM document used to define the parameters and plugin settings
    # for the session. For example, `SSM-SessionManagerRunShell`.
    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    # The ID of the Amazon Web Services user that started the session.
    @[JSON::Field(key: "Owner")]
    property owner : String | Nil

    # The reason for connecting to the instance.
    @[JSON::Field(key: "Reason")]
    property reason : String | Nil

    # Reserved for future use.
    @[JSON::Field(key: "Details")]
    property details : String | Nil

    # Reserved for future use.
    @[JSON::Field(key: "OutputUrl")]
    property output_url : SessionManagerOutputUrl | Nil

    # The maximum duration of a session before it terminates.
    @[JSON::Field(key: "MaxSessionDuration")]
    property max_session_duration : String | Nil

    # `Standard` access type is the default for Session Manager sessions. `JustInTime` is the access
    # type for [Just-in-time node
    # access](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-just-in-time-node-access.html).
    @[JSON::Field(key: "AccessType", converter: AS::AccessType)]
    property access_type : AccessType | Nil

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
      @max_session_duration : String | Nil = nil,
      @access_type : AccessType | Nil = nil,
    )
    end
  end
end
