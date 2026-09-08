private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The options for the transit gateway multicast domain.
  class CreateTransitGatewayMulticastDomainRequestOptions
    # Specify whether to enable Internet Group Management Protocol (IGMP) version 2 for the transit
    # gateway multicast domain.
    property igmpv_2_support : Igmpv2SupportValue | Nil

    # Specify whether to enable support for statically configuring multicast group sources for a
    # domain.
    property static_sources_support : StaticSourcesSupportValue | Nil

    # Indicates whether to automatically accept cross-account subnet associations that are associated
    # with the transit gateway multicast domain.
    property auto_accept_shared_associations : AutoAcceptSharedAssociationsValue | Nil

    def initialize(
      @igmpv_2_support : Igmpv2SupportValue | Nil = nil,
      @static_sources_support : StaticSourcesSupportValue | Nil = nil,
      @auto_accept_shared_associations : AutoAcceptSharedAssociationsValue | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @igmpv_2_support
        params << {"#{prefix}Igmpv2Support", value.to_json_object_key}
      end

      if value = @static_sources_support
        params << {"#{prefix}StaticSourcesSupport", value.to_json_object_key}
      end

      if value = @auto_accept_shared_associations
        params << {"#{prefix}AutoAcceptSharedAssociations", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        igmpv_2_support: (n = node.xpath_node("*[local-name()='Igmpv2Support']")) ? AEC::Igmpv2SupportValue.from_json_object_key?(n.content) : nil,
        static_sources_support: (n = node.xpath_node("*[local-name()='StaticSourcesSupport']")) ? AEC::StaticSourcesSupportValue.from_json_object_key?(n.content) : nil,
        auto_accept_shared_associations: (n = node.xpath_node("*[local-name()='AutoAcceptSharedAssociations']")) ? AEC::AutoAcceptSharedAssociationsValue.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@igmpv_2_support, @static_sources_support, @auto_accept_shared_associations)
  end
end
