private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes Availability Zones, Local Zones, and Wavelength Zones.
  class AvailabilityZone
    # For Availability Zones, this parameter always has the value of `opt-in-not-required`.
    #
    # For Local Zones and Wavelength Zones, this parameter is the opt-in status. The possible values
    # are `opted-in` and `not-opted-in`.
    property opt_in_status : AvailabilityZoneOptInStatus | Nil

    # Any messages about the Availability Zone, Local Zone, or Wavelength Zone.
    property messages : Array(AvailabilityZoneMessage) | Nil

    # The name of the Region.
    property region_name : String | Nil

    # The name of the Availability Zone, Local Zone, or Wavelength Zone.
    property zone_name : String | Nil

    # The ID of the Availability Zone, Local Zone, or Wavelength Zone.
    property zone_id : String | Nil

    # The name of the zone group. For example:
    #
    # - Availability Zones - `us-east-1-zg-1`
    #
    # - Local Zones - `us-west-2-lax-1`
    #
    # - Wavelength Zones - `us-east-1-wl1-bos-wlz-1`
    property group_name : String | Nil

    # The name of the network border group.
    property network_border_group : String | Nil

    # The type of zone.
    #
    # Valid values: `availability-zone` | `local-zone` | `wavelength-zone`
    property zone_type : String | Nil

    # The name of the zone that handles some of the Local Zone or Wavelength Zone control plane
    # operations, such as API calls.
    property parent_zone_name : String | Nil

    # The ID of the zone that handles some of the Local Zone or Wavelength Zone control plane
    # operations, such as API calls.
    property parent_zone_id : String | Nil

    # The long name of the Availability Zone group, Local Zone group, or Wavelength Zone group.
    property group_long_name : String | Nil

    # The geography information for the Availability Zone or Local Zone. The geography is returned as
    # a list.
    property geography : Array(AvailabilityZoneGeography) | Nil

    # The sub-geography information for the Availability Zone or Local Zone. The sub-geography is
    # returned as a list.
    property sub_geography : Array(AvailabilityZoneSubGeography) | Nil

    # The state of the Availability Zone, Local Zone, or Wavelength Zone. The possible values are
    # `available`, `unavailable`, and `constrained`.
    property state : AvailabilityZoneState | Nil

    def initialize(
      @opt_in_status : AvailabilityZoneOptInStatus | Nil = nil,
      @messages : Array(AvailabilityZoneMessage) | Nil = nil,
      @region_name : String | Nil = nil,
      @zone_name : String | Nil = nil,
      @zone_id : String | Nil = nil,
      @group_name : String | Nil = nil,
      @network_border_group : String | Nil = nil,
      @zone_type : String | Nil = nil,
      @parent_zone_name : String | Nil = nil,
      @parent_zone_id : String | Nil = nil,
      @group_long_name : String | Nil = nil,
      @geography : Array(AvailabilityZoneGeography) | Nil = nil,
      @sub_geography : Array(AvailabilityZoneSubGeography) | Nil = nil,
      @state : AvailabilityZoneState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @opt_in_status
        params << {"#{prefix}OptInStatus", value.to_json_object_key}
      end

      (@messages || [] of AvailabilityZoneMessage).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MessageSet.#{i}."))
      end

      if value = @region_name
        params << {"#{prefix}RegionName", value}
      end

      if value = @zone_name
        params << {"#{prefix}ZoneName", value}
      end

      if value = @zone_id
        params << {"#{prefix}ZoneId", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end

      if value = @zone_type
        params << {"#{prefix}ZoneType", value}
      end

      if value = @parent_zone_name
        params << {"#{prefix}ParentZoneName", value}
      end

      if value = @parent_zone_id
        params << {"#{prefix}ParentZoneId", value}
      end

      if value = @group_long_name
        params << {"#{prefix}GroupLongName", value}
      end

      (@geography || [] of AvailabilityZoneGeography).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GeographySet.#{i}."))
      end

      (@sub_geography || [] of AvailabilityZoneSubGeography).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SubGeographySet.#{i}."))
      end

      if value = @state
        params << {"#{prefix}ZoneState", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        opt_in_status: (n = node.xpath_node("*[local-name()='optInStatus']")) ? AEC::AvailabilityZoneOptInStatus.from_json_object_key?(n.content) : nil,
        messages: node.xpath_nodes("*[local-name()='messageSet']/*[local-name()='item']").map { |n| AvailabilityZoneMessage.from_xml(n) },
        region_name: Core::XMLValue.string(node.xpath_node("*[local-name()='regionName']")),
        zone_name: Core::XMLValue.string(node.xpath_node("*[local-name()='zoneName']")),
        zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='zoneId']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='networkBorderGroup']")),
        zone_type: Core::XMLValue.string(node.xpath_node("*[local-name()='zoneType']")),
        parent_zone_name: Core::XMLValue.string(node.xpath_node("*[local-name()='parentZoneName']")),
        parent_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='parentZoneId']")),
        group_long_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupLongName']")),
        geography: node.xpath_nodes("*[local-name()='geographySet']/*[local-name()='item']").map { |n| AvailabilityZoneGeography.from_xml(n) },
        sub_geography: node.xpath_nodes("*[local-name()='subGeographySet']/*[local-name()='item']").map { |n| AvailabilityZoneSubGeography.from_xml(n) },
        state: (n = node.xpath_node("*[local-name()='zoneState']")) ? AEC::AvailabilityZoneState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @messages
        value.each(&.validate!)
      end

      if value = @geography
        value.each(&.validate!)
      end

      if value = @sub_geography
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@opt_in_status, @messages, @region_name, @zone_name, @zone_id, @group_name, @network_border_group, @zone_type, @parent_zone_name, @parent_zone_id, @group_long_name, @geography, @sub_geography, @state)
  end
end
