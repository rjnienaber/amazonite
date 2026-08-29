private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListPoliciesGrantingServiceAccessEntry
    property service_namespace : String | Nil

    property policies : Array(PolicyGrantingServiceAccess) | Nil

    def initialize(
      @service_namespace : String | Nil = nil,
      @policies : Array(PolicyGrantingServiceAccess) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @service_namespace
        params << {"#{prefix}ServiceNamespace", value}
      end

      (@policies || [] of PolicyGrantingServiceAccess).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Policies.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_namespace: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceNamespace']")),
        policies: node.xpath_nodes("*[local-name()='Policies']/*[local-name()='member']").map { |n| PolicyGrantingServiceAccess.from_xml(n) },
      )
    end
  end
end
