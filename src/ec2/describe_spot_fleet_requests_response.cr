private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeSpotFleetRequests.
  class DescribeSpotFleetRequestsResponse
    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # Information about the configuration of your Spot Fleet.
    property spot_fleet_request_configs : Array(SpotFleetRequestConfig) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @spot_fleet_request_configs : Array(SpotFleetRequestConfig) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@spot_fleet_request_configs || [] of SpotFleetRequestConfig).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SpotFleetRequestConfigSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        spot_fleet_request_configs: node.xpath_nodes("*[local-name()='spotFleetRequestConfigSet']/*[local-name()='item']").map { |n| SpotFleetRequestConfig.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @spot_fleet_request_configs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @spot_fleet_request_configs)
  end
end
