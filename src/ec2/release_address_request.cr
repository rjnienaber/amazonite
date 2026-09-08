private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReleaseAddressRequest
    # The allocation ID. This parameter is required.
    property allocation_id : String | Nil

    # Deprecated.
    property public_ip : String | Nil

    # The set of Availability Zones, Local Zones, or Wavelength Zones from which Amazon Web Services
    # advertises IP addresses.
    #
    # If you provide an incorrect network border group, you receive an `InvalidAddress.NotFound`
    # error.
    property network_border_group : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @allocation_id : String | Nil = nil,
      @public_ip : String | Nil = nil,
      @network_border_group : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_id
        params << {"#{prefix}AllocationId", value}
      end

      if value = @public_ip
        params << {"#{prefix}PublicIp", value}
      end

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AllocationId']")),
        public_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='PublicIp']")),
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkBorderGroup']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allocation_id, @public_ip, @network_border_group, @dry_run)
  end
end
