private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateDelegationRequestRequest
    property owner_account_id : String | Nil

    property description : String

    property permissions : DelegationPermission

    property request_message : String | Nil

    property requestor_workflow_id : String

    property redirect_url : String | Nil

    property notification_channel : String

    property session_duration : Int32

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
  end
end
