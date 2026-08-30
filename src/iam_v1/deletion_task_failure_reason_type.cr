private alias Core = Amazonite::Core

module Amazonite::IamV1
  # The reason that the service-linked role deletion failed.
  #
  # This data type is used as a response element in the
  # [GetServiceLinkedRoleDeletionStatus](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLinkedRoleDeletionStatus.html)
  # operation.
  class DeletionTaskFailureReasonType
    # A short description of the reason that the service-linked role deletion failed.
    property reason : String | Nil

    # A list of objects that contains details about the service-linked role deletion failure, if that
    # information is returned by the service. If the service-linked role has active sessions or if any
    # resources that were used by the role have not been deleted from the linked service, the role
    # can't be deleted. This parameter includes a list of the resources that are associated with the
    # role and the Region in which the resources are being used.
    property role_usage_list : Array(RoleUsageType) | Nil

    def initialize(
      @reason : String | Nil = nil,
      @role_usage_list : Array(RoleUsageType) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @reason
        params << {"#{prefix}Reason", value}
      end

      (@role_usage_list || [] of RoleUsageType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RoleUsageList.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reason: Core::XMLValue.string(node.xpath_node("*[local-name()='Reason']")),
        role_usage_list: node.xpath_nodes("*[local-name()='RoleUsageList']/*[local-name()='member']").map { |n| RoleUsageType.from_xml(n) },
      )
    end
  end
end
