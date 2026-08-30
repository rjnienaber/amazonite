private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateDelegationRequestRequest
    # The Amazon Web Services account ID this delegation request is targeted to.
    #
    # If the account ID is not known, this parameter can be omitted, resulting in a request that can
    # be associated by any account. If the account ID passed, then the created delegation request can
    # only be associated with an identity of that target account.
    property owner_account_id : String | Nil

    # A description of the delegation request.
    property description : String

    # The permissions to be delegated in this delegation request.
    property permissions : DelegationPermission

    # A message explaining the reason for the delegation request.
    #
    # Requesters can utilize this field to add a custom note to the delegation request. This field is
    # different from the description such that this is to be utilized for a custom messaging on a
    # case-by-case basis.
    #
    # For example, if the current delegation request is in response to a previous request being
    # rejected, this explanation can be added to the request via this field.
    property request_message : String | Nil

    # The workflow ID associated with the requestor.
    #
    # This is the unique identifier on the partner side that can be used to track the progress of the
    # request.
    #
    # IAM maintains a uniqueness check on this workflow id for each request - if a workflow id for an
    # existing request is passed, this API call will fail.
    property requestor_workflow_id : String

    # The URL to redirect to after the delegation request is processed.
    #
    # This URL is used by the IAM console to show a link to the customer to re-load the partner
    # workflow.
    property redirect_url : String | Nil

    # The notification channel for updates about the delegation request.
    #
    # At this time,only SNS topic ARNs are accepted for notification. This topic ARN must have a
    # resource policy granting `SNS:Publish` permission to the IAM service principal
    # (`iam.amazonaws.com`). See [partner onboarding
    # documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies-temporary-delegation-partner-guide.html)
    # for more details.
    property notification_channel : String

    # The duration for which the delegated session should remain active, in seconds.
    #
    # The active time window for the session starts when the customer calls the
    # [SendDelegationToken](https://docs.aws.amazon.com/IAM/latest/APIReference/API_SendDelegationToken.html)
    # API.
    property session_duration : Int32

    # Specifies whether the delegation token should only be sent by the owner.
    #
    # This flag prevents any party other than the owner from calling `SendDelegationToken` API for
    # this delegation request. This behavior becomes useful when the delegation request owner needs to
    # be present for subsequent partner interactions, but the delegation request was sent to a more
    # privileged user for approval due to the owner lacking sufficient delegation permissions.
    property only_send_by_owner : Bool | Nil

    def initialize(
      @description : String,
      @permissions : DelegationPermission,
      @requestor_workflow_id : String,
      @notification_channel : String,
      @session_duration : Int32,
      @owner_account_id : String | Nil = nil,
      @request_message : String | Nil = nil,
      @redirect_url : String | Nil = nil,
      @only_send_by_owner : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_account_id
        params << {"#{prefix}OwnerAccountId", value}
      end

      params << {"#{prefix}Description", @description}

      params.concat(@permissions.to_query_params("#{prefix}Permissions."))

      if value = @request_message
        params << {"#{prefix}RequestMessage", value}
      end

      params << {"#{prefix}RequestorWorkflowId", @requestor_workflow_id}

      if value = @redirect_url
        params << {"#{prefix}RedirectUrl", value}
      end

      params << {"#{prefix}NotificationChannel", @notification_channel}

      params << {"#{prefix}SessionDuration", @session_duration.to_s}

      if value = @only_send_by_owner
        params << {"#{prefix}OnlySendByOwner", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OwnerAccountId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")).not_nil!,
        permissions: node.xpath_node("*[local-name()='Permissions']").try { |n| DelegationPermission.from_xml(n) }.not_nil!,
        request_message: Core::XMLValue.string(node.xpath_node("*[local-name()='RequestMessage']")),
        requestor_workflow_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RequestorWorkflowId']")).not_nil!,
        redirect_url: Core::XMLValue.string(node.xpath_node("*[local-name()='RedirectUrl']")),
        notification_channel: Core::XMLValue.string(node.xpath_node("*[local-name()='NotificationChannel']")).not_nil!,
        session_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='SessionDuration']")).not_nil!,
        only_send_by_owner: Core::XMLValue.bool(node.xpath_node("*[local-name()='OnlySendByOwner']")),
      )
    end

    def validate! : Nil
      if value = @owner_account_id
        raise Core::ValidationError.new("OwnerAccountId does not match the required pattern") unless value.matches?(Regex.new("^\\d{12}$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 1000") if value.size > 1000
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~¡-ÿ]*$"))
      end

      if value = @permissions
        value.validate!
      end

      if value = @request_message
        raise Core::ValidationError.new("RequestMessage length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("RequestMessage length must be <= 200") if value.size > 200
        raise Core::ValidationError.new("RequestMessage does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~¡-ÿ]*$"))
      end

      if value = @requestor_workflow_id
        raise Core::ValidationError.new("RequestorWorkflowId length must be >= 5") if value.size < 5
        raise Core::ValidationError.new("RequestorWorkflowId length must be <= 400") if value.size > 400
        raise Core::ValidationError.new("RequestorWorkflowId does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~¡-ÿ]+$"))
      end

      if value = @redirect_url
        raise Core::ValidationError.new("RedirectUrl length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RedirectUrl length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("RedirectUrl does not match the required pattern") unless value.matches?(Regex.new("^http(s?)://[a-zA-Z0-9._/-]*(\\?[a-zA-Z0-9._=&-]*)?(#[a-zA-Z0-9._/-]*)?$"))
      end

      if value = @notification_channel
        raise Core::ValidationError.new("NotificationChannel length must be >= 2") if value.size < 2
        raise Core::ValidationError.new("NotificationChannel length must be <= 400") if value.size > 400
        raise Core::ValidationError.new("NotificationChannel does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9:_.-]+$"))
      end

      if value = @session_duration
        raise Core::ValidationError.new("SessionDuration value must be >= 300") if value < 300
        raise Core::ValidationError.new("SessionDuration value must be <= 43200") if value > 43200
      end
    end

    def_equals_and_hash(@owner_account_id, @description, @permissions, @request_message, @requestor_workflow_id, @redirect_url, @notification_channel, @session_duration, @only_send_by_owner)
  end
end
