private alias Core = Amazonite::Core

module Amazonite::EC2
  # The set of DHCP options.
  class DhcpOptions
    # The ID of the Amazon Web Services account that owns the DHCP options set.
    property owner_id : String | Nil

    # Any tags assigned to the DHCP options set.
    property tags : Array(Tag) | Nil

    # The ID of the set of DHCP options.
    property dhcp_options_id : String | Nil

    # The DHCP options in the set.
    property dhcp_configurations : Array(DhcpConfiguration) | Nil

    def initialize(
      @owner_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @dhcp_options_id : String | Nil = nil,
      @dhcp_configurations : Array(DhcpConfiguration) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @dhcp_options_id
        params << {"#{prefix}DhcpOptionsId", value}
      end

      (@dhcp_configurations || [] of DhcpConfiguration).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DhcpConfigurationSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        dhcp_options_id: Core::XMLValue.string(node.xpath_node("*[local-name()='dhcpOptionsId']")),
        dhcp_configurations: node.xpath_nodes("*[local-name()='dhcpConfigurationSet']/*[local-name()='item']").map { |n| DhcpConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end

      if value = @dhcp_configurations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@owner_id, @tags, @dhcp_options_id, @dhcp_configurations)
  end
end
