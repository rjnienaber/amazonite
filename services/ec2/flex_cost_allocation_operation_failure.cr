private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a policy, association, or network resource that a Networking Flexible Cost Allocation
  # operation failed to process.
  class FlexCostAllocationOperationFailure
    # The ID of the resource that could not be processed.
    property resource_id : String | Nil

    # The code that identifies the type of failure. Possible values are:
    #
    # - `ResourceNotFound` - (`DeleteNetworkingFlexCostAllocationPolicies`) The policy doesn't exist
    # or isn't owned by your account.
    #
    # - `InvalidResourceState` - (`DeleteNetworkingFlexCostAllocationPolicies`) The policy has active
    # associations.
    #
    # - `InvalidResource` - (`AssociateNetworkingFlexCostAllocationPolicy`) The resource ID is
    # malformed, the resource type doesn't match the policy, or the scope is an account other than
    # yours. (`DisassociateNetworkingFlexCostAllocationPolicy`) The association doesn't exist or was
    # already removed.
    #
    # - `ResourceAlreadyAssociated` - (`AssociateNetworkingFlexCostAllocationPolicy`) The resource
    # already has an active association.
    #
    # - `InternalError` - An internal error occurred. Retry the request.
    property failure_code : String | Nil

    # The reason for the failure.
    property failure_reason : String | Nil

    def initialize(
      @resource_id : String | Nil = nil,
      @failure_code : String | Nil = nil,
      @failure_reason : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end

      if value = @failure_code
        params << {"#{prefix}FailureCode", value}
      end

      if value = @failure_reason
        params << {"#{prefix}FailureReason", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
        failure_code: Core::XMLValue.string(node.xpath_node("*[local-name()='failureCode']")),
        failure_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='failureReason']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@resource_id, @failure_code, @failure_reason)
  end
end
