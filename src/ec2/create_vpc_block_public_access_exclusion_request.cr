private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVpcBlockPublicAccessExclusionRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A subnet ID.
    property subnet_id : String | Nil

    # A VPC ID.
    property vpc_id : String | Nil

    # The exclusion mode for internet gateway traffic.
    #
    # - `allow-bidirectional`: Allow all internet traffic to and from the excluded VPCs and subnets.
    #
    # - `allow-egress`: Allow outbound internet traffic from the excluded VPCs and subnets. Block
    # inbound internet traffic to the excluded VPCs and subnets. Only applies when VPC Block Public
    # Access is set to Bidirectional.
    property internet_gateway_exclusion_mode : InternetGatewayExclusionMode

    # `tag` - The key/value combination of a tag assigned to the resource. Use the tag key in the
    # filter name and the tag value as the filter value. For example, to find all resources that have
    # a tag with the key `Owner` and the value `TeamA`, specify `tag:Owner` for the filter name and
    # `TeamA` for the filter value.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @internet_gateway_exclusion_mode : InternetGatewayExclusionMode,
      @dry_run : Bool | Nil = nil,
      @subnet_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      params << {"#{prefix}InternetGatewayExclusionMode", @internet_gateway_exclusion_mode.to_json_object_key}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcId']")),
        internet_gateway_exclusion_mode: ((n = node.xpath_node("*[local-name()='InternetGatewayExclusionMode']")) ? AEC::InternetGatewayExclusionMode.from_json_object_key?(n.content) : nil).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @subnet_id, @vpc_id, @internet_gateway_exclusion_mode, @tag_specifications)
  end
end
