private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetAssociatedEnclaveCertificateIamRolesResult
    # Information about the associated IAM roles.
    property associated_roles : Array(AssociatedRole) | Nil

    def initialize(
      @associated_roles : Array(AssociatedRole) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@associated_roles || [] of AssociatedRole).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AssociatedRoleSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        associated_roles: node.xpath_nodes("*[local-name()='associatedRoleSet']/*[local-name()='item']").map { |n| AssociatedRole.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @associated_roles
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@associated_roles)
  end
end
