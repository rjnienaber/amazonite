private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeNetworkInterfaceAttribute.
  class DescribeNetworkInterfaceAttributeRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the network interface.
    property network_interface_id : String

    # The attribute of the network interface. This parameter is required.
    property attribute : NetworkInterfaceAttribute | Nil

    def initialize(
      @network_interface_id : String,
      @dry_run : Bool | Nil = nil,
      @attribute : NetworkInterfaceAttribute | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}NetworkInterfaceId", @network_interface_id}

      if value = @attribute
        params << {"#{prefix}Attribute", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")).not_nil!,
        attribute: (n = node.xpath_node("*[local-name()='attribute']")) ? AEC::NetworkInterfaceAttribute.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @network_interface_id, @attribute)
  end
end
