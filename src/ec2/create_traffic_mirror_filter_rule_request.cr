private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTrafficMirrorFilterRuleRequest
    # The ID of the filter that this rule is associated with.
    property traffic_mirror_filter_id : String

    # The type of traffic.
    property traffic_direction : TrafficDirection

    # The number of the Traffic Mirror rule. This number must be unique for each Traffic Mirror rule
    # in a given direction. The rules are processed in ascending order by rule number.
    property rule_number : Int32

    # The action to take on the filtered traffic.
    property rule_action : TrafficMirrorRuleAction

    # The destination port range.
    property destination_port_range : TrafficMirrorPortRangeRequest | Nil

    # The source port range.
    property source_port_range : TrafficMirrorPortRangeRequest | Nil

    # The protocol, for example UDP, to assign to the Traffic Mirror rule.
    #
    # For information about the protocol value, see [Protocol
    # Numbers](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml) on the
    # Internet Assigned Numbers Authority (IANA) website.
    property protocol : Int32 | Nil

    # The destination CIDR block to assign to the Traffic Mirror rule.
    property destination_cidr_block : String

    # The source CIDR block to assign to the Traffic Mirror rule.
    property source_cidr_block : String

    # The description of the Traffic Mirror rule.
    property description : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [How to ensure
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # Traffic Mirroring tags specifications.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @traffic_mirror_filter_id : String,
      @traffic_direction : TrafficDirection,
      @rule_number : Int32,
      @rule_action : TrafficMirrorRuleAction,
      @destination_cidr_block : String,
      @source_cidr_block : String,
      @destination_port_range : TrafficMirrorPortRangeRequest | Nil = nil,
      @source_port_range : TrafficMirrorPortRangeRequest | Nil = nil,
      @protocol : Int32 | Nil = nil,
      @description : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TrafficMirrorFilterId", @traffic_mirror_filter_id}

      params << {"#{prefix}TrafficDirection", @traffic_direction.to_json_object_key}

      params << {"#{prefix}RuleNumber", @rule_number.to_s}

      params << {"#{prefix}RuleAction", @rule_action.to_json_object_key}

      if value = @destination_port_range
        params.concat(value.to_query_params("#{prefix}DestinationPortRange."))
      end

      if value = @source_port_range
        params.concat(value.to_query_params("#{prefix}SourcePortRange."))
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value.to_s}
      end

      params << {"#{prefix}DestinationCidrBlock", @destination_cidr_block}

      params << {"#{prefix}SourceCidrBlock", @source_cidr_block}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_filter_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TrafficMirrorFilterId']")).not_nil!,
        traffic_direction: ((n = node.xpath_node("*[local-name()='TrafficDirection']")) ? AEC::TrafficDirection.from_json_object_key?(n.content) : nil).not_nil!,
        rule_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='RuleNumber']")).not_nil!,
        rule_action: ((n = node.xpath_node("*[local-name()='RuleAction']")) ? AEC::TrafficMirrorRuleAction.from_json_object_key?(n.content) : nil).not_nil!,
        destination_port_range: node.xpath_node("*[local-name()='DestinationPortRange']").try { |n| TrafficMirrorPortRangeRequest.from_xml(n) },
        source_port_range: node.xpath_node("*[local-name()='SourcePortRange']").try { |n| TrafficMirrorPortRangeRequest.from_xml(n) },
        protocol: Core::XMLValue.i32(node.xpath_node("*[local-name()='Protocol']")),
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationCidrBlock']")).not_nil!,
        source_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='SourceCidrBlock']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @destination_port_range
        value.validate!
      end

      if value = @source_port_range
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@traffic_mirror_filter_id, @traffic_direction, @rule_number, @rule_action, @destination_port_range, @source_port_range, @protocol, @destination_cidr_block, @source_cidr_block, @description, @dry_run, @client_token, @tag_specifications)
  end
end
