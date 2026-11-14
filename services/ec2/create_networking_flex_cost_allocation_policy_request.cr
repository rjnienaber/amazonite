private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateNetworkingFlexCostAllocationPolicyRequest
    # The type of network resource that the policy applies to. This parameter is required. Valid
    # values are `natgw` (NAT gateway), `pcx` (Amazon VPC peering connection), and `ec2` (EC2
    # instance).
    #
    # Specify the policy document that matches the resource type: `NatFcaPolicyDocument` for `natgw`,
    # `InstanceFcaPolicyDocument` for `ec2`, or `PcxFcaPolicyDocument` for `pcx`. Don't specify a
    # policy document for a different resource type.
    property network_resource_type : FlexCostAllocationNetworkResourceType

    # The policy document that defines cost allocation for NAT gateways. Provide this document when
    # `NetworkResourceType` is `natgw`.
    property nat_fca_policy_document : NatFlexCostAllocationPolicyDocument | Nil

    # The policy document that defines cost allocation for EC2 instances. Provide this document when
    # `NetworkResourceType` is `ec2`.
    property instance_fca_policy_document : InstanceFlexCostAllocationPolicyDocument | Nil

    # The policy document that defines cost allocation for Amazon VPC peering connections. Provide
    # this document when `NetworkResourceType` is `pcx`.
    property pcx_fca_policy_document : PcxFlexCostAllocationPolicyDocument | Nil

    # Specifies whether showback reporting is enabled for the policy.
    #
    # Default: `true`
    property show_back_enabled : Bool | Nil

    # A description for the policy. The description can be up to 1024 characters long.
    property description : String | Nil

    # The tags to assign to the policy.
    property tag_specifications : Array(TagSpecification) | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @network_resource_type : FlexCostAllocationNetworkResourceType,
      @nat_fca_policy_document : NatFlexCostAllocationPolicyDocument | Nil = nil,
      @instance_fca_policy_document : InstanceFlexCostAllocationPolicyDocument | Nil = nil,
      @pcx_fca_policy_document : PcxFlexCostAllocationPolicyDocument | Nil = nil,
      @show_back_enabled : Bool | Nil = nil,
      @description : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}NetworkResourceType", @network_resource_type.to_json_object_key}

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

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecifications.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_resource_type: ((n = node.xpath_node("*[local-name()='NetworkResourceType']")) ? AEC::FlexCostAllocationNetworkResourceType.from_json_object_key?(n.content) : nil).not_nil!,
        nat_fca_policy_document: node.xpath_node("*[local-name()='NatFcaPolicyDocument']").try { |n| NatFlexCostAllocationPolicyDocument.from_xml(n) },
        instance_fca_policy_document: node.xpath_node("*[local-name()='InstanceFcaPolicyDocument']").try { |n| InstanceFlexCostAllocationPolicyDocument.from_xml(n) },
        pcx_fca_policy_document: node.xpath_node("*[local-name()='PcxFcaPolicyDocument']").try { |n| PcxFlexCostAllocationPolicyDocument.from_xml(n) },
        show_back_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='ShowBackEnabled']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecifications']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @nat_fca_policy_document
        value.validate!
      end

      if value = @instance_fca_policy_document
        value.validate!
      end

      if value = @pcx_fca_policy_document
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_resource_type, @nat_fca_policy_document, @instance_fca_policy_document, @pcx_fca_policy_document, @show_back_enabled, @description, @tag_specifications, @client_token, @dry_run)
  end
end
