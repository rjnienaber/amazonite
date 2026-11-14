private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a flex cost allocation policy.
  class FlexCostAllocationPolicyDescription
    # The ID of the policy.
    property fca_policy_id : String | Nil

    # The Amazon Resource Name (ARN) of the policy.
    property fca_policy_arn : String | Nil

    # The type of network resource that the policy applies to.
    property network_resource_type : FlexCostAllocationNetworkResourceType | Nil

    # The policy document that defines cost allocation for NAT gateways.
    property nat_fca_policy_document : NatFlexCostAllocationPolicyDocument | Nil

    # The policy document that defines cost allocation for EC2 instances.
    property instance_fca_policy_document : InstanceFlexCostAllocationPolicyDocument | Nil

    # The policy document that defines cost allocation for Amazon VPC peering connections.
    property pcx_fca_policy_document : PcxFlexCostAllocationPolicyDocument | Nil

    # Indicates whether showback reporting is enabled for the policy.
    property show_back_enabled : Bool | Nil

    # The ID of the account that owns the policy.
    property owner_account : String | Nil

    # The description of the policy.
    property description : String | Nil

    # The number of the latest version of the policy.
    property latest_version : Int32 | Nil

    # The date and time when the latest version of the policy is expected to apply to network traffic.
    # The policy configuration in this response is from the latest version.
    property version_expected_effective_at : Time | Nil

    # The date and time when the policy was created.
    property policy_created_at : Time | Nil

    # The date and time when the policy was last updated.
    property updated_at : Time | Nil

    # The entity that manages the policy. Valid values are:
    #
    # - `account` - The account that owns the policy created it.
    #
    # - `declarative-policy` - An Amazon Web Services Organizations declarative policy created the
    # policy. You can't modify or delete the policy.
    property managed_by : ManagedBy | Nil

    # The tags assigned to the policy.
    property tags : Array(Tag) | Nil

    def initialize(
      @fca_policy_id : String | Nil = nil,
      @fca_policy_arn : String | Nil = nil,
      @network_resource_type : FlexCostAllocationNetworkResourceType | Nil = nil,
      @nat_fca_policy_document : NatFlexCostAllocationPolicyDocument | Nil = nil,
      @instance_fca_policy_document : InstanceFlexCostAllocationPolicyDocument | Nil = nil,
      @pcx_fca_policy_document : PcxFlexCostAllocationPolicyDocument | Nil = nil,
      @show_back_enabled : Bool | Nil = nil,
      @owner_account : String | Nil = nil,
      @description : String | Nil = nil,
      @latest_version : Int32 | Nil = nil,
      @version_expected_effective_at : Time | Nil = nil,
      @policy_created_at : Time | Nil = nil,
      @updated_at : Time | Nil = nil,
      @managed_by : ManagedBy | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @fca_policy_id
        params << {"#{prefix}FcaPolicyId", value}
      end

      if value = @fca_policy_arn
        params << {"#{prefix}FcaPolicyArn", value}
      end

      if value = @network_resource_type
        params << {"#{prefix}NetworkResourceType", value.to_json_object_key}
      end

      if value = @nat_fca_policy_document
        params.concat(value.to_query_params("#{prefix}NatFcaPolicyDocument."))
      end

      if value = @instance_fca_policy_document
        params.concat(value.to_query_params("#{prefix}InstanceFcaPolicyDocument."))
      end

      if value = @pcx_fca_policy_document
        params.concat(value.to_query_params("#{prefix}PcxFcaPolicyDocument."))
      end

      if value = @show_back_enabled
        params << {"#{prefix}ShowBackEnabled", Core::QueryValue.bool(value)}
      end

      if value = @owner_account
        params << {"#{prefix}OwnerAccount", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @latest_version
        params << {"#{prefix}LatestVersion", value.to_s}
      end

      if value = @version_expected_effective_at
        params << {"#{prefix}VersionExpectedEffectiveAt", Core::QueryValue.time(value)}
      end

      if value = @policy_created_at
        params << {"#{prefix}PolicyCreatedAt", Core::QueryValue.time(value)}
      end

      if value = @updated_at
        params << {"#{prefix}UpdatedAt", Core::QueryValue.time(value)}
      end

      if value = @managed_by
        params << {"#{prefix}ManagedBy", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fca_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fcaPolicyId']")),
        fca_policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='fcaPolicyArn']")),
        network_resource_type: (n = node.xpath_node("*[local-name()='networkResourceType']")) ? AEC::FlexCostAllocationNetworkResourceType.from_json_object_key?(n.content) : nil,
        nat_fca_policy_document: node.xpath_node("*[local-name()='natFcaPolicyDocument']").try { |n| NatFlexCostAllocationPolicyDocument.from_xml(n) },
        instance_fca_policy_document: node.xpath_node("*[local-name()='instanceFcaPolicyDocument']").try { |n| InstanceFlexCostAllocationPolicyDocument.from_xml(n) },
        pcx_fca_policy_document: node.xpath_node("*[local-name()='pcxFcaPolicyDocument']").try { |n| PcxFlexCostAllocationPolicyDocument.from_xml(n) },
        show_back_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='showBackEnabled']")),
        owner_account: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerAccount']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        latest_version: Core::XMLValue.i32(node.xpath_node("*[local-name()='latestVersion']")),
        version_expected_effective_at: Core::XMLValue.time(node.xpath_node("*[local-name()='versionExpectedEffectiveAt']")),
        policy_created_at: Core::XMLValue.time(node.xpath_node("*[local-name()='policyCreatedAt']")),
        updated_at: Core::XMLValue.time(node.xpath_node("*[local-name()='updatedAt']")),
        managed_by: (n = node.xpath_node("*[local-name()='managedBy']")) ? AEC::ManagedBy.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tags']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @fca_policy_id
        raise Core::ValidationError.new("FcaPolicyId length must be >= 22") if value.size < 22
        raise Core::ValidationError.new("FcaPolicyId length must be <= 22") if value.size > 22
        raise Core::ValidationError.new("FcaPolicyId does not match the required pattern") unless value.matches?(Regex.new("^fcap-[a-f0-9]{17}$"))
      end

      if value = @fca_policy_arn
        raise Core::ValidationError.new("FcaPolicyArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FcaPolicyArn length must be <= 1024") if value.size > 1024
      end

      if value = @nat_fca_policy_document
        value.validate!
      end

      if value = @instance_fca_policy_document
        value.validate!
      end

      if value = @pcx_fca_policy_document
        value.validate!
      end

      if value = @latest_version
        raise Core::ValidationError.new("LatestVersion value must be >= 1") if value < 1
        raise Core::ValidationError.new("LatestVersion value must be <= 2147483647") if value > 2147483647
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@fca_policy_id, @fca_policy_arn, @network_resource_type, @nat_fca_policy_document, @instance_fca_policy_document, @pcx_fca_policy_document, @show_back_enabled, @owner_account, @description, @latest_version, @version_expected_effective_at, @policy_created_at, @updated_at, @managed_by, @tags)
  end
end
