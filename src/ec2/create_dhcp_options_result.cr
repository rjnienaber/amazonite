private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateDhcpOptionsResult
    # A set of DHCP options.
    property dhcp_options : DhcpOptions | Nil

    def initialize(
      @dhcp_options : DhcpOptions | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dhcp_options
        params.concat(value.to_query_params("#{prefix}DhcpOptions."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dhcp_options: node.xpath_node("*[local-name()='dhcpOptions']").try { |n| DhcpOptions.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @dhcp_options
        value.validate!
      end
    end

    def_equals_and_hash(@dhcp_options)
  end
end
