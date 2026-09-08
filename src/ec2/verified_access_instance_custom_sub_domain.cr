private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a custom subdomain for a network CIDR endpoint for Verified Access.
  class VerifiedAccessInstanceCustomSubDomain
    # The subdomain.
    property sub_domain : String | Nil

    # The name servers.
    property nameservers : Array(String) | Nil

    def initialize(
      @sub_domain : String | Nil = nil,
      @nameservers : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @sub_domain
        params << {"#{prefix}SubDomain", value}
      end

      (@nameservers || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NameserverSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        sub_domain: Core::XMLValue.string(node.xpath_node("*[local-name()='subDomain']")),
        nameservers: node.xpath_nodes("*[local-name()='nameserverSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@sub_domain, @nameservers)
  end
end
