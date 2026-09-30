private alias Core = Amazonite::Core

module Amazonite::Ssm
  class StartChangeRequestExecutionRequest
    include JSON::Serializable

    # The date and time specified in the change request to run the Automation runbooks.
    #
    # The Automation runbooks specified for the runbook workflow can't run until all required
    # approvals for the change request have been received.
    @[JSON::Field(key: "ScheduledTime", converter: Core::AWSEpochConverter)]
    property scheduled_time : Time | Nil

    # The name of the change template document to run during the runbook workflow.
    @[JSON::Field(key: "DocumentName")]
    property document_name : String

    # The version of the change template document to run during the runbook workflow.
    @[JSON::Field(key: "DocumentVersion")]
    property document_version : String | Nil

    # A key-value map of parameters that match the declared parameters in the change template
    # document.
    @[JSON::Field(key: "Parameters")]
    property parameters : Hash(String, Array(String)) | Nil

    # The name of the change request associated with the runbook workflow to be run.
    @[JSON::Field(key: "ChangeRequestName")]
    property change_request_name : String | Nil

    # The user-provided idempotency token. The token must be unique, is case insensitive, enforces the
    # UUID format, and can't be reused.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    # Indicates whether the change request can be approved automatically without the need for manual
    # approvals.
    #
    # If `AutoApprovable` is enabled in a change template, then setting `AutoApprove` to `true` in
    # `StartChangeRequestExecution` creates a change request that bypasses approver review.
    #
    # Change Calendar restrictions are not bypassed in this scenario. If the state of an associated
    # calendar is `CLOSED`, change freeze approvers must still grant permission for this change
    # request to run. If they don't, the change won't be processed until the calendar state is again
    # `OPEN`.
    @[JSON::Field(key: "AutoApprove")]
    property auto_approve : Bool | Nil

    # Information about the Automation runbooks that are run during the runbook workflow.
    #
    # The Automation runbooks specified for the runbook workflow can't run until all required
    # approvals for the change request have been received.
    @[JSON::Field(key: "Runbooks")]
    property runbooks : Array(Runbook) = [] of Runbook

    # Optional metadata that you assign to a resource. You can specify a maximum of five tags for a
    # change request. Tags enable you to categorize a resource in different ways, such as by purpose,
    # owner, or environment. For example, you might want to tag a change request to identify an
    # environment or target Amazon Web Services Region. In this case, you could specify the following
    # key-value pairs:
    #
    # - `Key=Environment,Value=Production`
    #
    # - `Key=Region,Value=us-east-2`
    #
    # The `Array Members` maximum value is reported as 1000. This number includes capacity reserved
    # for internal operations. When calling the `StartChangeRequestExecution` action, you can specify
    # a maximum of 5 tags. You can, however, use the AddTagsToResource action to add up to a total of
    # 50 tags to an existing change request configuration.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # The time that the requester expects the runbook workflow related to the change request to
    # complete. The time is an estimate only that the requester provides for reviewers.
    @[JSON::Field(key: "ScheduledEndTime", converter: Core::AWSEpochConverter)]
    property scheduled_end_time : Time | Nil

    # User-provided details about the change. If no details are provided, content specified in the
    # **Template information** section of the associated change template is added.
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
      @change_details : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @document_name
        raise Core::ValidationError.new("DocumentName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @document_version
        raise Core::ValidationError.new("DocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @parameters
        raise Core::ValidationError.new("Parameters must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Parameters must have at most 200 entry(s)") if value.size > 200
      end

      if value = @change_request_name
        raise Core::ValidationError.new("ChangeRequestName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChangeRequestName length must be <= 1024") if value.size > 1024
      end

      if value = @client_token
        raise Core::ValidationError.new("ClientToken length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("ClientToken length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("ClientToken does not match the required pattern") unless value.matches?(Regex.new("^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$"))
      end

      if value = @runbooks
        raise Core::ValidationError.new("Runbooks must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Runbooks must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 1000 item(s)") if value.size > 1000
        value.each(&.validate!)
      end

      if value = @change_details
        raise Core::ValidationError.new("ChangeDetails length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChangeDetails length must be <= 32768") if value.size > 32768
      end
    end

    def_equals_and_hash(@scheduled_time, @document_name, @document_version, @parameters, @change_request_name, @client_token, @auto_approve, @runbooks, @tags, @scheduled_end_time, @change_details)
  end
end
