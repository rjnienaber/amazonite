private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DelegationRequest
    property delegation_request_id : String | Nil

    property owner_account_id : String | Nil

    property description : String | Nil

    property request_message : String | Nil

    property permissions : DelegationPermission | Nil

    property permission_policy : String | Nil

    property role_permission_restriction_arns : Array(String) | Nil

    property owner_id : String | Nil

    property approver_id : String | Nil

    property state : StateType | Nil

    property expiration_time : Time | Nil

    property requestor_id : String | Nil

    property requestor_name : String | Nil

    property create_date : Time | Nil

    property session_duration : Int32 | Nil

    property redirect_url : String | Nil

    property notes : String | Nil

    property rejection_reason : String | Nil

    property only_send_by_owner : Bool | Nil

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
  end
end
