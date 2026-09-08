private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeregisterTransitGatewayMulticastGroupSourcesResult
    # Information about the deregistered group sources.
    property deregistered_multicast_group_sources : TransitGatewayMulticastDeregisteredGroupSources | Nil

    def initialize(
      @deregistered_multicast_group_sources : TransitGatewayMulticastDeregisteredGroupSources | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @deregistered_multicast_group_sources
        params.concat(value.to_query_params("#{prefix}DeregisteredMulticastGroupSources."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        deregistered_multicast_group_sources: node.xpath_node("*[local-name()='deregisteredMulticastGroupSources']").try { |n| TransitGatewayMulticastDeregisteredGroupSources.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @deregistered_multicast_group_sources
        value.validate!
      end
    end

    def_equals_and_hash(@deregistered_multicast_group_sources)
  end
end
