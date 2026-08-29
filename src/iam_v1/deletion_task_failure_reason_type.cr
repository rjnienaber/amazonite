private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeletionTaskFailureReasonType
    property reason : String | Nil

    property role_usage_list : Array(RoleUsageType) | Nil

    def initialize(
      @reason : String | Nil = nil,
      @role_usage_list : Array(RoleUsageType) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @reason
        params << {"#{prefix}Reason", value}
      end

      (@role_usage_list || [] of RoleUsageType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RoleUsageList.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reason: Core::XMLValue.string(node.xpath_node("*[local-name()='Reason']")),
        role_usage_list: node.xpath_nodes("*[local-name()='RoleUsageList']/*[local-name()='member']").map { |n| RoleUsageType.from_xml(n) },
      )
    end
  end
end
