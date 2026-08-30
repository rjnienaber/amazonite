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

    def validate! : Nil
      if value = @session_id
        raise Core::ValidationError.new("SessionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SessionId length must be <= 96") if value.size > 96
      end

      if value = @target
        raise Core::ValidationError.new("Target length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Target length must be <= 400") if value.size > 400
      end

      if value = @document_name
        raise Core::ValidationError.new("DocumentName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @owner
        raise Core::ValidationError.new("Owner length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Owner length must be <= 256") if value.size > 256
      end

      if value = @reason
        raise Core::ValidationError.new("Reason length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Reason length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Reason does not match the required pattern") unless value.matches?(Regex.new("^.{1,256}$"))
      end

      if value = @details
        raise Core::ValidationError.new("Details length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Details length must be <= 1024") if value.size > 1024
      end

      if value = @output_url
        value.validate!
      end

      if value = @max_session_duration
        raise Core::ValidationError.new("MaxSessionDuration length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("MaxSessionDuration length must be <= 4") if value.size > 4
        raise Core::ValidationError.new("MaxSessionDuration does not match the required pattern") unless value.matches?(Regex.new("^([1-9]|[1-9][0-9]|[1-9][0-9][0-9]|1[0-4][0-3][0-9]|1440)$"))
      end
    end

    def_equals_and_hash(@session_id, @target, @status, @start_date, @end_date, @document_name, @owner, @reason, @details, @output_url, @max_session_duration, @access_type)
  end
end
