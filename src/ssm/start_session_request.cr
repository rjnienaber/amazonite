private alias Core = Amazonite::Core

module Amazonite::Ssm
  class StartSessionRequest
    include JSON::Serializable

    # The managed node to connect to for the session.
    @[JSON::Field(key: "Target")]
    property target : String

    # The name of the SSM document you want to use to define the type of session, input parameters, or
    # preferences for the session. For example, `SSM-SessionManagerRunShell`. You can call the
    # GetDocument API to verify the document exists before attempting to start a session. If no
    # document name is provided, a shell to the managed node is launched by default. For more
    # information, see [Start a
    # session](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-sessions-start.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "DocumentName")]
    property document_name : String | Nil

    # The reason for connecting to the instance. This value is included in the details for the Amazon
    # CloudWatch Events event created when you start the session.
    @[JSON::Field(key: "Reason")]
    property reason : String | Nil

    # The values you want to specify for the parameters defined in the Session document. For more
    # information about these parameters, see [Create a Session Manager preferences
    # document](https://docs.aws.amazon.com/systems-manager/latest/userguide/getting-started-create-preferences-cli.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    def initialize(
      @target : String,
      @document_name : String | Nil = nil,
      @reason : String | Nil = nil,
      @parameters : Hash(String, Array(String)) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @target
        raise Core::ValidationError.new("Target length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Target length must be <= 400") if value.size > 400
      end

      if value = @document_name
        raise Core::ValidationError.new("DocumentName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @reason
        raise Core::ValidationError.new("Reason length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Reason length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Reason does not match the required pattern") unless value.matches?(Regex.new("^.{1,256}$"))
      end
    end

    def_equals_and_hash(@target, @document_name, @reason, @parameters)
  end
end
