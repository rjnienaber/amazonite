private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about an IPAM policy.
  #
  # An IPAM policy is a set of rules that define how public IPv4 addresses from IPAM pools are
  # allocated to Amazon Web Services resources. Each rule maps an Amazon Web Services service to
  # IPAM pools that the service will use to get IP addresses. A single policy can have multiple
  # rules and be applied to multiple Amazon Web Services Regions. If the IPAM pool run out of
  # addresses then the services fallback to Amazon-provided IP addresses. A policy can be applied to
  # an individual Amazon Web Services account or an entity within Amazon Web Services Organizations.
  class IpamPolicy
    # The account ID that owns the IPAM policy.
    property owner_id : String | Nil

    # The ID of the IPAM policy.
    property ipam_policy_id : String | Nil

    # The Amazon Resource Name (ARN) of the IPAM policy.
    property ipam_policy_arn : String | Nil

    # The Region of the IPAM policy.
    property ipam_policy_region : String | Nil

    # The state of the IPAM policy.
    property state : IpamPolicyState | Nil

    # A message about the state of the IPAM policy.
    property state_message : String | Nil

    # The tags assigned to the IPAM policy.
    property tags : Array(Tag) | Nil

    # The ID of the IPAM this policy belongs to.
    property ipam_id : String | Nil

    def initialize(
      @owner_id : String | Nil = nil,
      @ipam_policy_id : String | Nil = nil,
      @ipam_policy_arn : String | Nil = nil,
      @ipam_policy_region : String | Nil = nil,
      @state : IpamPolicyState | Nil = nil,
      @state_message : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @ipam_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @ipam_policy_id
        params << {"#{prefix}IpamPolicyId", value}
      end

      if value = @ipam_policy_arn
        params << {"#{prefix}IpamPolicyArn", value}
      end

      if value = @ipam_policy_region
        params << {"#{prefix}IpamPolicyRegion", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_message
        params << {"#{prefix}StateMessage", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @ipam_id
        params << {"#{prefix}IpamId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        ipam_policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPolicyId']")),
        ipam_policy_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPolicyArn']")),
        ipam_policy_region: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPolicyRegion']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamPolicyState.from_json_object_key?(n.content) : nil,
        state_message: Core::XMLValue.string(node.xpath_node("*[local-name()='stateMessage']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamId']")),
      )
    end

    def validate! : Nil
      if value = @ipam_policy_arn
        raise Core::ValidationError.new("IpamPolicyArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamPolicyArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@owner_id, @ipam_policy_id, @ipam_policy_arn, @ipam_policy_region, @state, @state_message, @tags, @ipam_id)
  end
end
