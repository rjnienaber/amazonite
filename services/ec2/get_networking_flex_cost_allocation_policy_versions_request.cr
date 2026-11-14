private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetNetworkingFlexCostAllocationPolicyVersionsRequest
    # The ID of the flex cost allocation policy. This parameter is required.
    property fca_policy_id : String

    # The policy versions to include in the results.
    property versions_to_include : Array(Int32) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @fca_policy_id : String,
      @versions_to_include : Array(Int32) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}FcaPolicyId", @fca_policy_id}

      (@versions_to_include || [] of Int32).each_with_index(1) do |item, i|
        params << {"#{prefix}VersionsToInclude.#{i}", item.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fca_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='FcaPolicyId']")).not_nil!,
        versions_to_include: node.xpath_nodes("*[local-name()='VersionsToInclude']/*[local-name()='item']").map { |n| n.content.to_i32 },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @fca_policy_id
        raise Core::ValidationError.new("FcaPolicyId length must be >= 22") if value.size < 22
        raise Core::ValidationError.new("FcaPolicyId length must be <= 22") if value.size > 22
        raise Core::ValidationError.new("FcaPolicyId does not match the required pattern") unless value.matches?(Regex.new("^fcap-[a-f0-9]{17}$"))
      end

      if value = @versions_to_include
        raise Core::ValidationError.new("VersionsToInclude must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("VersionsToInclude must have at most 100 item(s)") if value.size > 100
      end
    end

    def_equals_and_hash(@fca_policy_id, @versions_to_include, @dry_run)
  end
end
