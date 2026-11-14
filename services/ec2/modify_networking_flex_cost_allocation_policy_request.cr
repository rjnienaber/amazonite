private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyNetworkingFlexCostAllocationPolicyRequest
    # The ID of the flex cost allocation policy to modify. This parameter is required.
    property fca_policy_id : String

    # The updated policy document that defines cost allocation for NAT gateways.
    property nat_fca_policy_document : NatFlexCostAllocationPolicyDocument | Nil

    # The updated policy document that defines cost allocation for EC2 instances.
    property instance_fca_policy_document : InstanceFlexCostAllocationPolicyDocument | Nil

    # The updated policy document that defines cost allocation for Amazon VPC peering connections.
    property pcx_fca_policy_document : PcxFlexCostAllocationPolicyDocument | Nil

    # Specifies whether showback reporting is enabled for the policy. If you omit this parameter, the
    # current setting is unchanged.
    property show_back_enabled : Bool | Nil

    # A description for the policy. The description can be up to 1024 characters long.
    property description : String | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @fca_policy_id : String,
      @nat_fca_policy_document : NatFlexCostAllocationPolicyDocument | Nil = nil,
      @instance_fca_policy_document : InstanceFlexCostAllocationPolicyDocument | Nil = nil,
      @pcx_fca_policy_document : PcxFlexCostAllocationPolicyDocument | Nil = nil,
      @show_back_enabled : Bool | Nil = nil,
      @description : String | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}FcaPolicyId", @fca_policy_id}

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
        fca_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='FcaPolicyId']")).not_nil!,
        nat_fca_policy_document: node.xpath_node("*[local-name()='NatFcaPolicyDocument']").try { |n| NatFlexCostAllocationPolicyDocument.from_xml(n) },
        instance_fca_policy_document: node.xpath_node("*[local-name()='InstanceFcaPolicyDocument']").try { |n| InstanceFlexCostAllocationPolicyDocument.from_xml(n) },
        pcx_fca_policy_document: node.xpath_node("*[local-name()='PcxFcaPolicyDocument']").try { |n| PcxFlexCostAllocationPolicyDocument.from_xml(n) },
        show_back_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='ShowBackEnabled']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @fca_policy_id
        raise Core::ValidationError.new("FcaPolicyId length must be >= 22") if value.size < 22
        raise Core::ValidationError.new("FcaPolicyId length must be <= 22") if value.size > 22
        raise Core::ValidationError.new("FcaPolicyId does not match the required pattern") unless value.matches?(Regex.new("^fcap-[a-f0-9]{17}$"))
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

    def_equals_and_hash(@fca_policy_id, @nat_fca_policy_document, @instance_fca_policy_document, @pcx_fca_policy_document, @show_back_enabled, @description, @client_token, @dry_run)
  end
end
