private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of CancelSpotFleetRequests.
  class CancelSpotFleetRequestsResponse
    # Information about the Spot Fleet requests that are successfully canceled.
    property successful_fleet_requests : Array(CancelSpotFleetRequestsSuccessItem) | Nil

    # Information about the Spot Fleet requests that are not successfully canceled.
    property unsuccessful_fleet_requests : Array(CancelSpotFleetRequestsErrorItem) | Nil

    def initialize(
      @successful_fleet_requests : Array(CancelSpotFleetRequestsSuccessItem) | Nil = nil,
      @unsuccessful_fleet_requests : Array(CancelSpotFleetRequestsErrorItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@successful_fleet_requests || [] of CancelSpotFleetRequestsSuccessItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SuccessfulFleetRequestSet.#{i}."))
      end

      (@unsuccessful_fleet_requests || [] of CancelSpotFleetRequestsErrorItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}UnsuccessfulFleetRequestSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        successful_fleet_requests: node.xpath_nodes("*[local-name()='successfulFleetRequestSet']/*[local-name()='item']").map { |n| CancelSpotFleetRequestsSuccessItem.from_xml(n) },
        unsuccessful_fleet_requests: node.xpath_nodes("*[local-name()='unsuccessfulFleetRequestSet']/*[local-name()='item']").map { |n| CancelSpotFleetRequestsErrorItem.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @successful_fleet_requests
        value.each(&.validate!)
      end

      if value = @unsuccessful_fleet_requests
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@successful_fleet_requests, @unsuccessful_fleet_requests)
  end
end
