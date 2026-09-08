private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeNetworkInterfaceAttribute.
  class DescribeNetworkInterfaceAttributeResult
    # The attachment (if any) of the network interface.
    property attachment : NetworkInterfaceAttachment | Nil

    # The description of the network interface.
    property description : AttributeValue | Nil

    # The security groups associated with the network interface.
    property groups : Array(GroupIdentifier) | Nil

    # The ID of the network interface.
    property network_interface_id : String | Nil

    # Indicates whether source/destination checking is enabled.
    property source_dest_check : AttributeBooleanValue | Nil

    # Indicates whether to assign a public IPv4 address to a network interface. This option can be
    # enabled for any network interface but will only apply to the primary network interface (eth0).
    property associate_public_ip_address : Bool | Nil

    def initialize(
      @attachment : NetworkInterfaceAttachment | Nil = nil,
      @description : AttributeValue | Nil = nil,
      @groups : Array(GroupIdentifier) | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @source_dest_check : AttributeBooleanValue | Nil = nil,
      @associate_public_ip_address : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @attachment
        params.concat(value.to_query_params("#{prefix}Attachment."))
      end

      if value = @description
        params.concat(value.to_query_params("#{prefix}Description."))
      end

      (@groups || [] of GroupIdentifier).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupSet.#{i}."))
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @source_dest_check
        params.concat(value.to_query_params("#{prefix}SourceDestCheck."))
      end

      if value = @associate_public_ip_address
        params << {"#{prefix}AssociatePublicIpAddress", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attachment: node.xpath_node("*[local-name()='attachment']").try { |n| NetworkInterfaceAttachment.from_xml(n) },
        description: node.xpath_node("*[local-name()='description']").try { |n| AttributeValue.from_xml(n) },
        groups: node.xpath_nodes("*[local-name()='groupSet']/*[local-name()='item']").map { |n| GroupIdentifier.from_xml(n) },
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        source_dest_check: node.xpath_node("*[local-name()='sourceDestCheck']").try { |n| AttributeBooleanValue.from_xml(n) },
        associate_public_ip_address: Core::XMLValue.bool(node.xpath_node("*[local-name()='associatePublicIpAddress']")),
      )
    end

    def validate! : Nil
      if value = @attachment
        value.validate!
      end

      if value = @description
        value.validate!
      end

      if value = @groups
        value.each(&.validate!)
      end

      if value = @source_dest_check
        value.validate!
      end
    end

    def_equals_and_hash(@attachment, @description, @groups, @network_interface_id, @source_dest_check, @associate_public_ip_address)
  end
end
