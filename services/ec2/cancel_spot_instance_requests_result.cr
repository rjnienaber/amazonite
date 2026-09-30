private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of CancelSpotInstanceRequests.
  class CancelSpotInstanceRequestsResult
    # The Spot Instance requests.
    property cancelled_spot_instance_requests : Array(CancelledSpotInstanceRequest) | Nil

    def initialize(
      @cancelled_spot_instance_requests : Array(CancelledSpotInstanceRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@cancelled_spot_instance_requests || [] of CancelledSpotInstanceRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SpotInstanceRequestSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cancelled_spot_instance_requests: node.xpath_nodes("*[local-name()='spotInstanceRequestSet']/*[local-name()='item']").map { |n| CancelledSpotInstanceRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @cancelled_spot_instance_requests
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@cancelled_spot_instance_requests)
  end
end
