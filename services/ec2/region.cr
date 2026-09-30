private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Region.
  class Region
    # The Region opt-in status. The possible values are `opt-in-not-required`, `opted-in`, and
    # `not-opted-in`.
    property opt_in_status : String | Nil

    # The geography information for the Region. The geography is returned as a list.
    property geography : Array(RegionGeography) | Nil

    # The name of the Region.
    property region_name : String | Nil

    # The Region service endpoint.
    property endpoint : String | Nil

    def initialize(
      @opt_in_status : String | Nil = nil,
      @geography : Array(RegionGeography) | Nil = nil,
      @region_name : String | Nil = nil,
      @endpoint : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @opt_in_status
        params << {"#{prefix}OptInStatus", value}
      end

      (@geography || [] of RegionGeography).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GeographySet.#{i}."))
      end

      if value = @region_name
        params << {"#{prefix}RegionName", value}
      end

      if value = @endpoint
        params << {"#{prefix}RegionEndpoint", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        opt_in_status: Core::XMLValue.string(node.xpath_node("*[local-name()='optInStatus']")),
        geography: node.xpath_nodes("*[local-name()='geographySet']/*[local-name()='item']").map { |n| RegionGeography.from_xml(n) },
        region_name: Core::XMLValue.string(node.xpath_node("*[local-name()='regionName']")),
        endpoint: Core::XMLValue.string(node.xpath_node("*[local-name()='regionEndpoint']")),
      )
    end

    def validate! : Nil
      if value = @geography
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@opt_in_status, @geography, @region_name, @endpoint)
  end
end
