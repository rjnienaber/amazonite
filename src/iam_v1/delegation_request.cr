private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about a delegation request, including its status, permissions, and
  # associated metadata.
  class DelegationRequest
    # The unique identifier for the delegation request.
    property delegation_request_id : String | Nil

    # Amazon Web Services account ID of the owner of the delegation request.
    property owner_account_id : String | Nil

    # Description of the delegation request. This is a message that is provided by the Amazon Web
    # Services partner that filed the delegation request.
    property description : String | Nil

    # A custom message that is added to the delegation request by the partner.
    #
    # This element is different from the `Description` element such that this is a request specific
    # message injected by the partner. The `Description` is typically a generic explanation of what
    # the delegation request is targeted to do.
    property request_message : String | Nil

    property permissions : DelegationPermission | Nil

    # JSON content of the associated permission policy of this delegation request.
    property permission_policy : String | Nil

    # If the `PermissionPolicy` includes role creation permissions, this element will include the list
    # of permissions boundary policies associated with the role creation. See [Permissions boundaries
    # for IAM
    # entities](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html) for
    # more details about IAM permission boundaries.
    property role_permission_restriction_arns : Array(String) | Nil

    # ARN of the owner of this delegation request.
    property owner_id : String | Nil

    property approver_id : String | Nil

    # The state of this delegation request.
    #
    # See the [Understanding the Request
    # Lifecycle](https://docs.aws.amazon.com/IAM/latest/UserGuide/temporary-delegation-building-integration.html#temporary-delegation-request-lifecycle)
    # for an explanation of how these states are transitioned.
    property state : StateType | Nil

    # The expiry time of this delegation request
    #
    # See the [Understanding the Request
    # Lifecycle](https://docs.aws.amazon.com/IAM/latest/UserGuide/temporary-delegation-building-integration.html#temporary-delegation-request-lifecycle)
    # for details on the life time of a delegation request at each state.
    property expiration_time : Time | Nil

    # Identity of the requestor of this delegation request. This will be an Amazon Web Services
    # account ID.
    property requestor_id : String | Nil

    # A friendly name of the requestor.
    property requestor_name : String | Nil

    # Creation date (timestamp) of this delegation request.
    property create_date : Time | Nil

    # The life-time of the requested session credential.
    property session_duration : Int32 | Nil

    # A URL to be redirected to once the delegation request is approved. Partners provide this URL
    # when creating the delegation request.
    property redirect_url : String | Nil

    # Notes added to this delegation request, if this request was updated via the
    # [UpdateDelegationRequest](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateDelegationRequest.html)
    # API.
    property notes : String | Nil

    # Reasons for rejecting this delegation request, if this request was rejected. See also
    # [RejectDelegationRequest](https://docs.aws.amazon.com/IAM/latest/APIReference/API_RejectDelegationRequest.html)
    # API documentation.
    property rejection_reason : String | Nil

    # A flag indicating whether the
    # [SendDelegationToken](https://docs.aws.amazon.com/IAM/latest/APIReference/API_SendDelegationToken.html)
    # must be called by the owner of this delegation request. This is set by the requesting partner.
    property only_send_by_owner : Bool | Nil

    # Last updated timestamp of the request.
    property updated_time : Time | Nil

    def initialize(
      @delegation_request_id : String | Nil = nil,
      @owner_account_id : String | Nil = nil,
      @description : String | Nil = nil,
      @request_message : String | Nil = nil,
      @permissions : DelegationPermission | Nil = nil,
      @permission_policy : String | Nil = nil,
      @role_permission_restriction_arns : Array(String) | Nil = nil,
      @owner_id : String | Nil = nil,
      @approver_id : String | Nil = nil,
      @state : StateType | Nil = nil,
      @expiration_time : Time | Nil = nil,
      @requestor_id : String | Nil = nil,
      @requestor_name : String | Nil = nil,
      @create_date : Time | Nil = nil,
      @session_duration : Int32 | Nil = nil,
      @redirect_url : String | Nil = nil,
      @notes : String | Nil = nil,
      @rejection_reason : String | Nil = nil,
      @only_send_by_owner : Bool | Nil = nil,
      @updated_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @delegation_request_id
        params << {"#{prefix}DelegationRequestId", value}
      end

      if value = @owner_account_id
        params << {"#{prefix}OwnerAccountId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @request_message
        params << {"#{prefix}RequestMessage", value}
      end

      if value = @permissions
        params.concat(value.to_query_params("#{prefix}Permissions."))
      end

      if value = @permission_policy
        params << {"#{prefix}PermissionPolicy", value}
      end

      (@role_permission_restriction_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RolePermissionRestrictionArns.member.#{i}", item}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @approver_id
        params << {"#{prefix}ApproverId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @expiration_time
        params << {"#{prefix}ExpirationTime", Core::QueryValue.time(value)}
      end

      if value = @requestor_id
        params << {"#{prefix}RequestorId", value}
      end

      if value = @requestor_name
        params << {"#{prefix}RequestorName", value}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      if value = @session_duration
        params << {"#{prefix}SessionDuration", value.to_s}
      end

      if value = @redirect_url
        params << {"#{prefix}RedirectUrl", value}
      end

      if value = @notes
        params << {"#{prefix}Notes", value}
      end

      if value = @rejection_reason
        params << {"#{prefix}RejectionReason", value}
      end

      if value = @only_send_by_owner
        params << {"#{prefix}OnlySendByOwner", Core::QueryValue.bool(value)}
      end

      if value = @updated_time
        params << {"#{prefix}UpdatedTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        delegation_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DelegationRequestId']")),
        owner_account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OwnerAccountId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        request_message: Core::XMLValue.string(node.xpath_node("*[local-name()='RequestMessage']")),
        permissions: node.xpath_node("*[local-name()='Permissions']").try { |n| DelegationPermission.from_xml(n) },
        permission_policy: Core::XMLValue.string(node.xpath_node("*[local-name()='PermissionPolicy']")),
        role_permission_restriction_arns: node.xpath_nodes("*[local-name()='RolePermissionRestrictionArns']/*[local-name()='member']").map { |n| n.content },
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='OwnerId']")),
        approver_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ApproverId']")),
        state: (n = node.xpath_node("*[local-name()='State']")) ? AI::StateType.from_json_object_key?(n.content) : nil,
        expiration_time: Core::XMLValue.time(node.xpath_node("*[local-name()='ExpirationTime']")),
        requestor_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RequestorId']")),
        requestor_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RequestorName']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        session_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='SessionDuration']")),
        redirect_url: Core::XMLValue.string(node.xpath_node("*[local-name()='RedirectUrl']")),
        notes: Core::XMLValue.string(node.xpath_node("*[local-name()='Notes']")),
        rejection_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='RejectionReason']")),
        only_send_by_owner: Core::XMLValue.bool(node.xpath_node("*[local-name()='OnlySendByOwner']")),
        updated_time: Core::XMLValue.time(node.xpath_node("*[local-name()='UpdatedTime']")),
      )
    end

    def validate! : Nil
      if value = @delegation_request_id
        raise Core::ValidationError.new("DelegationRequestId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("DelegationRequestId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("DelegationRequestId does not match the required pattern") unless value.matches?(Regex.new("^[\\w-]+$"))
      end

      if value = @owner_account_id
        raise Core::ValidationError.new("OwnerAccountId does not match the required pattern") unless value.matches?(Regex.new("^\\d{12}$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 1000") if value.size > 1000
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~¡-ÿ]*$"))
      end

      if value = @request_message
        raise Core::ValidationError.new("RequestMessage length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("RequestMessage length must be <= 200") if value.size > 200
        raise Core::ValidationError.new("RequestMessage does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~¡-ÿ]*$"))
      end

      if value = @permissions
        value.validate!
      end

      if value = @owner_id
        raise Core::ValidationError.new("OwnerId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("OwnerId length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("OwnerId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9:/+=,.@_-]+$"))
      end

      if value = @approver_id
        raise Core::ValidationError.new("ApproverId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ApproverId length must be <= 2048") if value.size > 2048
      end

      if value = @requestor_id
        raise Core::ValidationError.new("RequestorId does not match the required pattern") unless value.matches?(Regex.new("^\\d{12}$"))
      end

      if value = @requestor_name
        raise Core::ValidationError.new("RequestorName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("RequestorName length must be <= 30") if value.size > 30
        raise Core::ValidationError.new("RequestorName does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~¡-ÿ]*$"))
      end

      if value = @session_duration
        raise Core::ValidationError.new("SessionDuration value must be >= 300") if value < 300
        raise Core::ValidationError.new("SessionDuration value must be <= 43200") if value > 43200
      end

      if value = @redirect_url
        raise Core::ValidationError.new("RedirectUrl length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RedirectUrl length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("RedirectUrl does not match the required pattern") unless value.matches?(Regex.new("^http(s?)://[a-zA-Z0-9._/-]*(\\?[a-zA-Z0-9._=&-]*)?(#[a-zA-Z0-9._/-]*)?$"))
      end

      if value = @notes
        raise Core::ValidationError.new("Notes length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Notes length must be <= 500") if value.size > 500
        raise Core::ValidationError.new("Notes does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~¡-ÿ]*$"))
      end

      if value = @rejection_reason
        raise Core::ValidationError.new("RejectionReason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("RejectionReason length must be <= 500") if value.size > 500
        raise Core::ValidationError.new("RejectionReason does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -~¡-ÿ]*$"))
      end
    end

    def_equals_and_hash(@delegation_request_id, @owner_account_id, @description, @request_message, @permissions, @permission_policy, @role_permission_restriction_arns, @owner_id, @approver_id, @state, @expiration_time, @requestor_id, @requestor_name, @create_date, @session_duration, @redirect_url, @notes, @rejection_reason, @only_send_by_owner, @updated_time)
  end
end
