private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the DNS server to be used.
  class DnsServersOptionsModifyStructure
    # The IPv4 address range, in CIDR notation, of the DNS servers to be used. You can specify up to
    # two DNS servers. Ensure that the DNS servers can be reached by the clients. The specified values
    # overwrite the existing values.
    property custom_dns_servers : Array(String) | Nil

    # Indicates whether DNS servers should be used. Specify `False` to delete the existing DNS
    # servers.
    property enabled : Bool | Nil

    def initialize(
      @custom_dns_servers : Array(String) | Nil = nil,
      @enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@custom_dns_servers || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}CustomDnsServers.#{i}", item}
      end

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        custom_dns_servers: node.xpath_nodes("*[local-name()='CustomDnsServers']/*[local-name()='item']").map { |n| n.content },
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@custom_dns_servers, @enabled)
  end
end
