private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for ResetNetworkInterfaceAttribute.
  class ResetNetworkInterfaceAttributeRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the network interface.
    property network_interface_id : String

    # The source/destination checking attribute. Resets the value to `true`.
    property source_dest_check : String | Nil

    def initialize(
      @network_interface_id : String,
      @dry_run : Bool | Nil = nil,
      @source_dest_check : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}NetworkInterfaceId", @network_interface_id}

      if value = @source_dest_check
        params << {"#{prefix}SourceDestCheck", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")).not_nil!,
        source_dest_check: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceDestCheck']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @network_interface_id, @source_dest_check)
  end
end
