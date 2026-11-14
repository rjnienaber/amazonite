private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a version of a flex cost allocation policy.
  class FlexCostAllocationPolicyVersion
    # The ID of the policy.
    property fca_policy_id : String | Nil

    # The version number.
    property version : Int32 | Nil

    # The type of network resource that the policy applies to.
    property network_resource_type : FlexCostAllocationNetworkResourceType | Nil

    # The policy document that defines cost allocation for NAT gateways.
    property nat_fca_policy_document : NatFlexCostAllocationPolicyDocument | Nil

    # The policy document that defines cost allocation for EC2 instances.
    property instance_fca_policy_document : InstanceFlexCostAllocationPolicyDocument | Nil

    # The policy document that defines cost allocation for Amazon VPC peering connections.
    property pcx_fca_policy_document : PcxFlexCostAllocationPolicyDocument | Nil

    # Indicates whether showback reporting is enabled for this version of the policy.
    property show_back_enabled : Bool | Nil

    # The description of this version of the policy.
    property description : String | Nil

    # The date and time when this version of the policy is expected to apply to network traffic.
    property expected_effective_at : Time | Nil

    # The date and time when this version of the policy was created.
    property created_at : Time | Nil

    def initialize(
      @fca_policy_id : String | Nil = nil,
      @version : Int32 | Nil = nil,
      @network_resource_type : FlexCostAllocationNetworkResourceType | Nil = nil,
      @nat_fca_policy_document : NatFlexCostAllocationPolicyDocument | Nil = nil,
      @instance_fca_policy_document : InstanceFlexCostAllocationPolicyDocument | Nil = nil,
      @pcx_fca_policy_document : PcxFlexCostAllocationPolicyDocument | Nil = nil,
      @show_back_enabled : Bool | Nil = nil,
      @description : String | Nil = nil,
      @expected_effective_at : Time | Nil = nil,
      @created_at : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @fca_policy_id
        params << {"#{prefix}FcaPolicyId", value}
      end

      if value = @version
        params << {"#{prefix}Version", value.to_s}
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

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @expected_effective_at
        params << {"#{prefix}ExpectedEffectiveAt", Core::QueryValue.time(value)}
      end

      if value = @created_at
        params << {"#{prefix}CreatedAt", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fca_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fcaPolicyId']")),
        version: Core::XMLValue.i32(node.xpath_node("*[local-name()='version']")),
        network_resource_type: (n = node.xpath_node("*[local-name()='networkResourceType']")) ? AEC::FlexCostAllocationNetworkResourceType.from_json_object_key?(n.content) : nil,
        nat_fca_policy_document: node.xpath_node("*[local-name()='natFcaPolicyDocument']").try { |n| NatFlexCostAllocationPolicyDocument.from_xml(n) },
        instance_fca_policy_document: node.xpath_node("*[local-name()='instanceFcaPolicyDocument']").try { |n| InstanceFlexCostAllocationPolicyDocument.from_xml(n) },
        pcx_fca_policy_document: node.xpath_node("*[local-name()='pcxFcaPolicyDocument']").try { |n| PcxFlexCostAllocationPolicyDocument.from_xml(n) },
        show_back_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='showBackEnabled']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        expected_effective_at: Core::XMLValue.time(node.xpath_node("*[local-name()='expectedEffectiveAt']")),
        created_at: Core::XMLValue.time(node.xpath_node("*[local-name()='createdAt']")),
      )
    end

    def validate! : Nil
      if value = @fca_policy_id
        raise Core::ValidationError.new("FcaPolicyId length must be >= 22") if value.size < 22
        raise Core::ValidationError.new("FcaPolicyId length must be <= 22") if value.size > 22
        raise Core::ValidationError.new("FcaPolicyId does not match the required pattern") unless value.matches?(Regex.new("^fcap-[a-f0-9]{17}$"))
      end

      if value = @version
        raise Core::ValidationError.new("Version value must be >= 1") if value < 1
        raise Core::ValidationError.new("Version value must be <= 2147483647") if value > 2147483647
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
    end

    def_equals_and_hash(@fca_policy_id, @version, @network_resource_type, @nat_fca_policy_document, @instance_fca_policy_document, @pcx_fca_policy_document, @show_back_enabled, @description, @expected_effective_at, @created_at)
  end
end
