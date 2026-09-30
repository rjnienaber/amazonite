private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateDhcpOptionsRequest
    # A DHCP configuration option.
    property dhcp_configurations : Array(NewDhcpConfiguration) = [] of NewDhcpConfiguration

    # The tags to assign to the DHCP option.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @dhcp_configurations : Array(NewDhcpConfiguration),
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @dhcp_configurations.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DhcpConfiguration.#{i}."))
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dhcp_configurations: node.xpath_nodes("*[local-name()='dhcpConfiguration']/*[local-name()='item']").map { |n| NewDhcpConfiguration.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @dhcp_configurations
        value.each(&.validate!)
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dhcp_configurations, @tag_specifications, @dry_run)
  end
end
