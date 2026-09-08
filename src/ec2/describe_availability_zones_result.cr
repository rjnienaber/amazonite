private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeAvailabilityZonesResult
    # Information about the Availability Zones, Local Zones, and Wavelength Zones.
    property availability_zones : Array(AvailabilityZone) | Nil

    def initialize(
      @availability_zones : Array(AvailabilityZone) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@availability_zones || [] of AvailabilityZone).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AvailabilityZoneInfo.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zones: node.xpath_nodes("*[local-name()='availabilityZoneInfo']/*[local-name()='item']").map { |n| AvailabilityZone.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @availability_zones
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@availability_zones)
  end
end
