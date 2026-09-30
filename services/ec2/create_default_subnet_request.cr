private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateDefaultSubnetRequest
    # The Availability Zone in which to create the default subnet.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified, but not both.
    property availability_zone : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Indicates whether to create an IPv6 only subnet. If you already have a default subnet for this
    # Availability Zone, you must delete it before you can create an IPv6 only subnet.
    property ipv_6_native : Bool | Nil

    # The ID of the Availability Zone.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` must be specified, but not both.
    property availability_zone_id : String | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @ipv_6_native : Bool | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @ipv_6_native
        params << {"#{prefix}Ipv6Native", Core::QueryValue.bool(value)}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipv_6_native: Core::XMLValue.bool(node.xpath_node("*[local-name()='Ipv6Native']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@availability_zone, @dry_run, @ipv_6_native, @availability_zone_id)
  end
end
