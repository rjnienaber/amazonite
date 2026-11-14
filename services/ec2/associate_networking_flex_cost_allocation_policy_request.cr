private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateNetworkingFlexCostAllocationPolicyRequest
    # The ID of the flex cost allocation policy to associate. This parameter is required.
    property fca_policy_id : String

    # The IDs of the network resources to associate with the policy. You can specify from 1 to 20
    # resource IDs.
    #
    # You must specify `NetworkResourceIds`, `NetworkResourceScope`, or both. A request can include at
    # most 20 distinct resources in total.
    property network_resource_ids : Array(String) | Nil

    # The scope of network resources to associate with the policy. Use a scope to associate the policy
    # with the resources in an account, Amazon VPC, or subnet.
    #
    # You must specify `NetworkResourceScope`, `NetworkResourceIds`, or both.
    property network_resource_scope : FlexCostAllocationNetworkResourceScope | Nil

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
      @network_resource_ids : Array(String) | Nil = nil,
      @network_resource_scope : FlexCostAllocationNetworkResourceScope | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}FcaPolicyId", @fca_policy_id}

      (@network_resource_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkResourceIds.#{i}", item}
      end

      if value = @network_resource_scope
        params.concat(value.to_query_params("#{prefix}NetworkResourceScope."))
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
        network_resource_ids: node.xpath_nodes("*[local-name()='NetworkResourceIds']/*[local-name()='item']").map { |n| n.content },
        network_resource_scope: node.xpath_node("*[local-name()='NetworkResourceScope']").try { |n| FlexCostAllocationNetworkResourceScope.from_xml(n) },
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

      if value = @network_resource_ids
        raise Core::ValidationError.new("NetworkResourceIds must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("NetworkResourceIds must have at most 20 item(s)") if value.size > 20
      end

      if value = @network_resource_scope
        value.validate!
      end
    end

    def_equals_and_hash(@fca_policy_id, @network_resource_ids, @network_resource_scope, @client_token, @dry_run)
  end
end
