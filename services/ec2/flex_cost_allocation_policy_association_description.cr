private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an association between a flex cost allocation policy and a network resource.
  class FlexCostAllocationPolicyAssociationDescription
    # The ID of the policy association.
    property fca_policy_association_id : String | Nil

    # The ID of the policy.
    property fca_policy_id : String | Nil

    # The ID of the associated network resource.
    property network_resource_id : String | Nil

    # The ID of the account that owns the association.
    property owner_account : String | Nil

    # The date and time when the association was created.
    property associated_at : Time | Nil

    # The date and time when the association is expected to apply to network traffic.
    property expected_effective_at : Time | Nil

    # The mode of the association. Valid values:
    #
    # - `direct` - The policy is associated with specific resources by resource ID.
    #
    # - `scope` - The policy is associated with a scope of resources in an account, Amazon VPC, or
    # subnet.
    property association_mode : FlexCostAllocationAssociationMode | Nil

    # The entity that manages the association. Valid values are:
    #
    # - `account` - The account that owns the association created it.
    #
    # - `declarative-policy` - An Amazon Web Services Organizations declarative policy created the
    # association. You can't remove the association.
    property managed_by : ManagedBy | Nil

    def initialize(
      @fca_policy_association_id : String | Nil = nil,
      @fca_policy_id : String | Nil = nil,
      @network_resource_id : String | Nil = nil,
      @owner_account : String | Nil = nil,
      @associated_at : Time | Nil = nil,
      @expected_effective_at : Time | Nil = nil,
      @association_mode : FlexCostAllocationAssociationMode | Nil = nil,
      @managed_by : ManagedBy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @fca_policy_association_id
        params << {"#{prefix}FcaPolicyAssociationId", value}
      end

      if value = @fca_policy_id
        params << {"#{prefix}FcaPolicyId", value}
      end

      if value = @network_resource_id
        params << {"#{prefix}NetworkResourceId", value}
      end

      if value = @owner_account
        params << {"#{prefix}OwnerAccount", value}
      end

      if value = @associated_at
        params << {"#{prefix}AssociatedAt", Core::QueryValue.time(value)}
      end

      if value = @expected_effective_at
        params << {"#{prefix}ExpectedEffectiveAt", Core::QueryValue.time(value)}
      end

      if value = @association_mode
        params << {"#{prefix}AssociationMode", value.to_json_object_key}
      end

      if value = @managed_by
        params << {"#{prefix}ManagedBy", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fca_policy_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fcaPolicyAssociationId']")),
        fca_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fcaPolicyId']")),
        network_resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkResourceId']")),
        owner_account: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerAccount']")),
        associated_at: Core::XMLValue.time(node.xpath_node("*[local-name()='associatedAt']")),
        expected_effective_at: Core::XMLValue.time(node.xpath_node("*[local-name()='expectedEffectiveAt']")),
        association_mode: (n = node.xpath_node("*[local-name()='associationMode']")) ? AEC::FlexCostAllocationAssociationMode.from_json_object_key?(n.content) : nil,
        managed_by: (n = node.xpath_node("*[local-name()='managedBy']")) ? AEC::ManagedBy.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @fca_policy_association_id
        raise Core::ValidationError.new("FcaPolicyAssociationId length must be >= 27") if value.size < 27
        raise Core::ValidationError.new("FcaPolicyAssociationId length must be <= 27") if value.size > 27
        raise Core::ValidationError.new("FcaPolicyAssociationId does not match the required pattern") unless value.matches?(Regex.new("^fcapassoc-[a-f0-9]{17}$"))
      end

      if value = @fca_policy_id
        raise Core::ValidationError.new("FcaPolicyId length must be >= 22") if value.size < 22
        raise Core::ValidationError.new("FcaPolicyId length must be <= 22") if value.size > 22
        raise Core::ValidationError.new("FcaPolicyId does not match the required pattern") unless value.matches?(Regex.new("^fcap-[a-f0-9]{17}$"))
      end
    end

    def_equals_and_hash(@fca_policy_association_id, @fca_policy_id, @network_resource_id, @owner_account, @associated_at, @expected_effective_at, @association_mode, @managed_by)
  end
end
