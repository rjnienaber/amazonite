private alias Core = Amazonite::Core

module Amazonite::IamV1
  # An object that contains details about how a service-linked role is used, if that information is
  # returned by the service.
  #
  # This data type is used as a response element in the
  # [GetServiceLinkedRoleDeletionStatus](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServiceLinkedRoleDeletionStatus.html)
  # operation.
  class RoleUsageType
    # The name of the Region where the service-linked role is being used.
    property region : String | Nil

    # The name of the resource that is using the service-linked role.
    property resources : Array(String) | Nil

    def initialize(
      @region : String | Nil = nil,
      @resources : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @region
        params << {"#{prefix}Region", value}
      end

      (@resources || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Resources.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='Region']")),
        resources: node.xpath_nodes("*[local-name()='Resources']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
