private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcBlockPublicAccessExclusionRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of an exclusion.
    property exclusion_id : String

    # The exclusion mode for internet gateway traffic.
    #
    # - `allow-bidirectional`: Allow all internet traffic to and from the excluded VPCs and subnets.
    #
    # - `allow-egress`: Allow outbound internet traffic from the excluded VPCs and subnets. Block
    # inbound internet traffic to the excluded VPCs and subnets. Only applies when VPC Block Public
    # Access is set to Bidirectional.
    property internet_gateway_exclusion_mode : InternetGatewayExclusionMode

    def initialize(
      @exclusion_id : String,
      @internet_gateway_exclusion_mode : InternetGatewayExclusionMode,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}ExclusionId", @exclusion_id}

      params << {"#{prefix}InternetGatewayExclusionMode", @internet_gateway_exclusion_mode.to_json_object_key}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        exclusion_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ExclusionId']")).not_nil!,
        internet_gateway_exclusion_mode: ((n = node.xpath_node("*[local-name()='InternetGatewayExclusionMode']")) ? AEC::InternetGatewayExclusionMode.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @exclusion_id, @internet_gateway_exclusion_mode)
  end
end
