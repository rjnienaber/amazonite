private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # A VPC BPA exclusion is a mode that can be applied to a single VPC or subnet that exempts it from
  # the account’s BPA mode and will allow bidirectional or egress-only access. You can create BPA
  # exclusions for VPCs and subnets even when BPA is not enabled on the account to ensure that there
  # is no traffic disruption to the exclusions when VPC BPA is turned on. To learn more about VPC
  # BPA, see [Block public access to VPCs and
  # subnets](https://docs.aws.amazon.com/vpc/latest/userguide/security-vpc-bpa.html) in the *Amazon
  # VPC User Guide*.
  class VpcBlockPublicAccessExclusion
    # The ID of the exclusion.
    property exclusion_id : String | Nil

    # The exclusion mode for internet gateway traffic.
    #
    # - `allow-bidirectional`: Allow all internet traffic to and from the excluded VPCs and subnets.
    #
    # - `allow-egress`: Allow outbound internet traffic from the excluded VPCs and subnets. Block
    # inbound internet traffic to the excluded VPCs and subnets. Only applies when VPC Block Public
    # Access is set to Bidirectional.
    property internet_gateway_exclusion_mode : InternetGatewayExclusionMode | Nil

    # The ARN of the exclusion.
    property resource_arn : String | Nil

    # The state of the exclusion.
    property state : VpcBlockPublicAccessExclusionState | Nil

    # The reason for the current exclusion state.
    property reason : String | Nil

    # When the exclusion was created.
    property creation_timestamp : Time | Nil

    # When the exclusion was last updated.
    property last_update_timestamp : Time | Nil

    # When the exclusion was deleted.
    property deletion_timestamp : Time | Nil

    # `tag` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    property tags : Array(Tag) | Nil

    def initialize(
      @exclusion_id : String | Nil = nil,
      @internet_gateway_exclusion_mode : InternetGatewayExclusionMode | Nil = nil,
      @resource_arn : String | Nil = nil,
      @state : VpcBlockPublicAccessExclusionState | Nil = nil,
      @reason : String | Nil = nil,
      @creation_timestamp : Time | Nil = nil,
      @last_update_timestamp : Time | Nil = nil,
      @deletion_timestamp : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @exclusion_id
        params << {"#{prefix}ExclusionId", value}
      end

      if value = @internet_gateway_exclusion_mode
        params << {"#{prefix}InternetGatewayExclusionMode", value.to_json_object_key}
      end

      if value = @resource_arn
        params << {"#{prefix}ResourceArn", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @reason
        params << {"#{prefix}Reason", value}
      end

      if value = @creation_timestamp
        params << {"#{prefix}CreationTimestamp", Core::QueryValue.time(value)}
      end

      if value = @last_update_timestamp
        params << {"#{prefix}LastUpdateTimestamp", Core::QueryValue.time(value)}
      end

      if value = @deletion_timestamp
        params << {"#{prefix}DeletionTimestamp", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        exclusion_id: Core::XMLValue.string(node.xpath_node("*[local-name()='exclusionId']")),
        internet_gateway_exclusion_mode: (n = node.xpath_node("*[local-name()='internetGatewayExclusionMode']")) ? AEC::InternetGatewayExclusionMode.from_json_object_key?(n.content) : nil,
        resource_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceArn']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::VpcBlockPublicAccessExclusionState.from_json_object_key?(n.content) : nil,
        reason: Core::XMLValue.string(node.xpath_node("*[local-name()='reason']")),
        creation_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTimestamp']")),
        last_update_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='lastUpdateTimestamp']")),
        deletion_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='deletionTimestamp']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@exclusion_id, @internet_gateway_exclusion_mode, @resource_arn, @state, @reason, @creation_timestamp, @last_update_timestamp, @deletion_timestamp, @tags)
  end
end
