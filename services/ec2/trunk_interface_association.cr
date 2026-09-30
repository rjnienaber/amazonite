private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about an association between a branch network interface with a trunk network
  # interface.
  class TrunkInterfaceAssociation
    # The ID of the association.
    property association_id : String | Nil

    # The ID of the branch network interface.
    property branch_interface_id : String | Nil

    # The ID of the trunk network interface.
    property trunk_interface_id : String | Nil

    # The interface protocol. Valid values are `VLAN` and `GRE`.
    property interface_protocol : InterfaceProtocolType | Nil

    # The ID of the VLAN when you use the VLAN protocol.
    property vlan_id : Int32 | Nil

    # The application key when you use the GRE protocol.
    property gre_key : Int32 | Nil

    # The tags for the trunk interface association.
    property tags : Array(Tag) | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @branch_interface_id : String | Nil = nil,
      @trunk_interface_id : String | Nil = nil,
      @interface_protocol : InterfaceProtocolType | Nil = nil,
      @vlan_id : Int32 | Nil = nil,
      @gre_key : Int32 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @association_id
        params << {"#{prefix}AssociationId", value}
      end

      if value = @branch_interface_id
        params << {"#{prefix}BranchInterfaceId", value}
      end

      if value = @trunk_interface_id
        params << {"#{prefix}TrunkInterfaceId", value}
      end

      if value = @interface_protocol
        params << {"#{prefix}InterfaceProtocol", value.to_json_object_key}
      end

      if value = @vlan_id
        params << {"#{prefix}VlanId", value.to_s}
      end

      if value = @gre_key
        params << {"#{prefix}GreKey", value.to_s}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")),
        branch_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='branchInterfaceId']")),
        trunk_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='trunkInterfaceId']")),
        interface_protocol: (n = node.xpath_node("*[local-name()='interfaceProtocol']")) ? AEC::InterfaceProtocolType.from_json_object_key?(n.content) : nil,
        vlan_id: Core::XMLValue.i32(node.xpath_node("*[local-name()='vlanId']")),
        gre_key: Core::XMLValue.i32(node.xpath_node("*[local-name()='greKey']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@association_id, @branch_interface_id, @trunk_interface_id, @interface_protocol, @vlan_id, @gre_key, @tags)
  end
end
