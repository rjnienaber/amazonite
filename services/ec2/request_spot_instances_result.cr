private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of RequestSpotInstances.
  class RequestSpotInstancesResult
    # The Spot Instance requests.
    property spot_instance_requests : Array(SpotInstanceRequest) | Nil

    def initialize(
      @spot_instance_requests : Array(SpotInstanceRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@spot_instance_requests || [] of SpotInstanceRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SpotInstanceRequestSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        spot_instance_requests: node.xpath_nodes("*[local-name()='spotInstanceRequestSet']/*[local-name()='item']").map { |n| SpotInstanceRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @spot_instance_requests
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@spot_instance_requests)
  end
end
