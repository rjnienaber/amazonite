module Amazonite::SsmV1
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

    def_equals_and_hash(@target, @document_name, @reason, @parameters)
  end
end
