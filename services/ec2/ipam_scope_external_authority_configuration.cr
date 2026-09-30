private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The configuration that links an Amazon VPC IPAM scope to an external authority system. It
  # specifies the type of external system and the external resource identifier that identifies your
  # account or instance in that system.
  #
  # In IPAM, an external authority is a third-party IP address management system that provides CIDR
  # blocks when you provision address space for top-level IPAM pools. This allows you to use your
  # existing IP management system to control which address ranges are allocated to Amazon Web
  # Services while using Amazon VPC IPAM to manage subnets within those ranges.
  class IpamScopeExternalAuthorityConfiguration
    # The type of external authority managing this scope. Currently supports `Infoblox` for
    # integration with Infoblox Universal DDI.
    property type : IpamScopeExternalAuthorityType | Nil

    # The identifier for the external resource managing this scope. For Infoblox integrations, this is
    # the Infoblox resource identifier in the format `.identity.account..`.
    property external_resource_identifier : String | Nil

    def initialize(
      @type : IpamScopeExternalAuthorityType | Nil = nil,
      @external_resource_identifier : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @external_resource_identifier
        params << {"#{prefix}ExternalResourceIdentifier", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::IpamScopeExternalAuthorityType.from_json_object_key?(n.content) : nil,
        external_resource_identifier: Core::XMLValue.string(node.xpath_node("*[local-name()='externalResourceIdentifier']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@type, @external_resource_identifier)
  end
end
