private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an association between a network ACL and a subnet.
  class NetworkAclAssociation
    # The ID of the association between a network ACL and a subnet.
    property network_acl_association_id : String | Nil

    # The ID of the network ACL.
    property network_acl_id : String | Nil

    # The ID of the subnet.
    property subnet_id : String | Nil

    def initialize(
      @network_acl_association_id : String | Nil = nil,
      @network_acl_id : String | Nil = nil,
      @subnet_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_acl_association_id
        params << {"#{prefix}NetworkAclAssociationId", value}
      end

      if value = @network_acl_id
        params << {"#{prefix}NetworkAclId", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_acl_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkAclAssociationId']")),
        network_acl_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkAclId']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@network_acl_association_id, @network_acl_id, @subnet_id)
  end
end
