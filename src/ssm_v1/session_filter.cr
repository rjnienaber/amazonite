private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes a filter for Session Manager information.
  class SessionFilter
    include JSON::Serializable

    # The name of the filter.
    @[JSON::Field(key: "key", converter: AS::SessionFilterKey)]
    property key : SessionFilterKey

    # The filter value. Valid values for each filter key are as follows:
    #
    # - InvokedAfter: Specify a timestamp to limit your results. For example, specify
    # 2024-08-29T00:00:00Z to see sessions that started August 29, 2024, and later.
    #
    # - InvokedBefore: Specify a timestamp to limit your results. For example, specify
    # 2024-08-29T00:00:00Z to see sessions that started before August 29, 2024.
    #
    # - Target: Specify a managed node to which session connections have been made.
    #
    # - Owner: Specify an Amazon Web Services user to see a list of sessions started by that user.
    #
    # - Status: Specify a valid session status to see a list of all sessions with that status. Status
    # values you can specify include:
    #
    # - Connected
    #
    # - Connecting
    #
    # - Disconnected
    #
    # - Terminated
    #
    # - Terminating
    #
    # - Failed
    #
    # - SessionId: Specify a session ID to return details about the session.
    @[JSON::Field(key: "value")]
    property value : String

    def initialize(
      @key : SessionFilterKey,
      @value : String,
    )
    end

    def validate! : Nil
      if value = @value
        raise Core::ValidationError.new("value length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("value length must be <= 400") if value.size > 400
      end
    end

    def_equals_and_hash(@key, @value)
  end
end
