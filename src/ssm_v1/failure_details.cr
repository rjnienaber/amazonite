module Amazonite::SsmV1
  # Information about an Automation failure.
  class FailureDetails
    include JSON::Serializable

    # The stage of the Automation execution when the failure occurred. The stages include the
    # following: InputValidation, PreVerification, Invocation, PostVerification.
    @[JSON::Field(key: "FailureStage")]
    property failure_stage : String | Nil

    # The type of Automation failure. Failure types include the following: Action, Permission,
    # Throttling, Verification, Internal.
    @[JSON::Field(key: "FailureType")]
    property failure_type : String | Nil

    # Detailed information about the Automation step failure.
    @[JSON::Field(key: "Details")]
    property details : Hash(String, Array(String)) | Nil

    def initialize(
      @failure_stage : String | Nil = nil,
      @failure_type : String | Nil = nil,
      @details : Hash(String, Array(String)) | Nil = nil,
    )
    end

    def_equals_and_hash(@failure_stage, @failure_type, @details)
  end
end
