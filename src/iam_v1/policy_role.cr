private alias Core = Amazonite::Core

module Amazonite::IamV1
  class PolicyRole
    property role_name : String | Nil

    property role_id : String | Nil

    def initialize(
      @role_name : String | Nil = nil,
      @role_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @role_name
        params << {"#{prefix}RoleName", value}
      end

      if value = @role_id
        params << {"#{prefix}RoleId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        role_name: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleName']")),
        role_id: Core::XMLValue.string(node.xpath_node("*[local-name()='RoleId']")),
      )
    end
  end
end
