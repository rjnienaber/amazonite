private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about an appliance attached to a NAT Gateway, providing managed security solutions
  # for traffic filtering and inspection.
  class NatGatewayAttachedAppliance
    # The type of appliance attached to the NAT Gateway. For network firewall proxy functionality,
    # this will be "network-firewall-proxy".
    property type : NatGatewayApplianceType | Nil

    # The Amazon Resource Name (ARN) of the attached appliance, identifying the specific proxy or
    # security appliance resource.
    property appliance_arn : String | Nil

    # The VPC endpoint ID used to route traffic from application VPCs to the proxy for inspection and
    # filtering.
    property vpc_endpoint_id : String | Nil

    # The current attachment state of the appliance.
    property attachment_state : NatGatewayApplianceState | Nil

    # The current modification state of the appliance.
    property modification_state : NatGatewayApplianceModifyState | Nil

    # The failure code if the appliance attachment or modification operation failed.
    property failure_code : String | Nil

    # A descriptive message explaining the failure if the appliance attachment or modification
    # operation failed.
    property failure_message : String | Nil

    def initialize(
      @type : NatGatewayApplianceType | Nil = nil,
      @appliance_arn : String | Nil = nil,
      @vpc_endpoint_id : String | Nil = nil,
      @attachment_state : NatGatewayApplianceState | Nil = nil,
      @modification_state : NatGatewayApplianceModifyState | Nil = nil,
      @failure_code : String | Nil = nil,
      @failure_message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @appliance_arn
        params << {"#{prefix}ApplianceArn", value}
      end

      if value = @vpc_endpoint_id
        params << {"#{prefix}VpcEndpointId", value}
      end

      if value = @attachment_state
        params << {"#{prefix}AttachmentState", value.to_json_object_key}
      end

      if value = @modification_state
        params << {"#{prefix}ModificationState", value.to_json_object_key}
      end

      if value = @failure_code
        params << {"#{prefix}FailureCode", value}
      end

      if value = @failure_message
        params << {"#{prefix}FailureMessage", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::NatGatewayApplianceType.from_json_object_key?(n.content) : nil,
        appliance_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='applianceArn']")),
        vpc_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcEndpointId']")),
        attachment_state: (n = node.xpath_node("*[local-name()='attachmentState']")) ? AEC::NatGatewayApplianceState.from_json_object_key?(n.content) : nil,
        modification_state: (n = node.xpath_node("*[local-name()='modificationState']")) ? AEC::NatGatewayApplianceModifyState.from_json_object_key?(n.content) : nil,
        failure_code: Core::XMLValue.string(node.xpath_node("*[local-name()='failureCode']")),
        failure_message: Core::XMLValue.string(node.xpath_node("*[local-name()='failureMessage']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@type, @appliance_arn, @vpc_endpoint_id, @attachment_state, @modification_state, @failure_code, @failure_message)
  end
end
