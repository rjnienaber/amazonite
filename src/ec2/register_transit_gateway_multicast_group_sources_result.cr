private alias Core = Amazonite::Core

module Amazonite::EC2
  class RegisterTransitGatewayMulticastGroupSourcesResult
    # Information about the transit gateway multicast group sources.
    property registered_multicast_group_sources : TransitGatewayMulticastRegisteredGroupSources | Nil

    def initialize(
      @registered_multicast_group_sources : TransitGatewayMulticastRegisteredGroupSources | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @registered_multicast_group_sources
        params.concat(value.to_query_params("#{prefix}RegisteredMulticastGroupSources."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        registered_multicast_group_sources: node.xpath_node("*[local-name()='registeredMulticastGroupSources']").try { |n| TransitGatewayMulticastRegisteredGroupSources.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @registered_multicast_group_sources
        value.validate!
      end
    end

    def_equals_and_hash(@registered_multicast_group_sources)
  end
end
