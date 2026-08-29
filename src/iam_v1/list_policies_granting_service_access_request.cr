private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListPoliciesGrantingServiceAccessRequest
    property marker : String | Nil

    property arn : String

    property service_namespaces : Array(String) = [] of String

    def initialize(
      @arn : String,
      @service_namespaces : Array(String),
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      params << {"#{prefix}Arn", @arn}

      @service_namespaces.each_with_index(1) do |item, i|
        params << {"#{prefix}ServiceNamespaces.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        service_namespaces: node.xpath_nodes("*[local-name()='ServiceNamespaces']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
