private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeAvailabilityZonesRequest
    # The names of the Availability Zones, Local Zones, and Wavelength Zones.
    property zone_names : Array(String) | Nil

    # The IDs of the Availability Zones, Local Zones, and Wavelength Zones.
    property zone_ids : Array(String) | Nil

    # Include all Availability Zones, Local Zones, and Wavelength Zones regardless of your opt-in
    # status.
    #
    # If you do not use this parameter, the results include only the zones for the Regions where you
    # have chosen the option to opt in.
    property all_availability_zones : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `group-long-name` - The long name of the zone group for the Availability Zone (for example,
    # `US West (Oregon) 1`), the Local Zone (for example, for Zone group `us-west-2-lax-1`, it is `US
    # West (Los Angeles)`, or the Wavelength Zone (for example, for Zone group `us-east-1-wl1`, it is
    # `US East (Verizon)`.
    #
    # - `group-name` - The name of the zone group for the Availability Zone (for example,
    # `us-east-1-zg-1`), the Local Zone (for example, `us-west-2-lax-1`), or the Wavelength Zone (for
    # example, `us-east-1-wl1`).
    #
    # - `message` - The Zone message.
    #
    # - `opt-in-status` - The opt-in status (`opted-in` | `not-opted-in` | `opt-in-not-required`).
    #
    # - `parent-zone-id` - The ID of the zone that handles some of the Local Zone and Wavelength Zone
    # control plane operations, such as API calls.
    #
    # - `parent-zone-name` - The ID of the zone that handles some of the Local Zone and Wavelength
    # Zone control plane operations, such as API calls.
    #
    # - `region-name` - The name of the Region for the Zone (for example, `us-east-1`).
    #
    # - `state` - The state of the Availability Zone, the Local Zone, or the Wavelength Zone
    # (`available` | `unavailable` | `constrained`).
    #
    # - `zone-id` - The ID of the Availability Zone (for example, `use1-az1`), the Local Zone (for
    # example, `usw2-lax1-az1`), or the Wavelength Zone (for example, `us-east-1-wl1-bos-wlz-1`).
    #
    # - `zone-name` - The name of the Availability Zone (for example, `us-east-1a`), the Local Zone
    # (for example, `us-west-2-lax-1a`), or the Wavelength Zone (for example,
    # `us-east-1-wl1-bos-wlz-1`).
    #
    # - `zone-type` - The type of zone (`availability-zone` | `local-zone` | `wavelength-zone`).
    property filters : Array(Filter) | Nil

    def initialize(
      @zone_names : Array(String) | Nil = nil,
      @zone_ids : Array(String) | Nil = nil,
      @all_availability_zones : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@zone_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ZoneName.#{i}", item}
      end

      (@zone_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ZoneId.#{i}", item}
      end

      if value = @all_availability_zones
        params << {"#{prefix}AllAvailabilityZones", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        zone_names: node.xpath_nodes("*[local-name()='ZoneName']/*[local-name()='ZoneName']").map { |n| n.content },
        zone_ids: node.xpath_nodes("*[local-name()='ZoneId']/*[local-name()='ZoneId']").map { |n| n.content },
        all_availability_zones: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllAvailabilityZones']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@zone_names, @zone_ids, @all_availability_zones, @dry_run, @filters)
  end
end
