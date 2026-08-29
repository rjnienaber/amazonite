private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListServiceSpecificCredentialsResponse
    property service_specific_credentials : Array(ServiceSpecificCredentialMetadata) | Nil

    property marker : String | Nil

    property is_truncated : Bool | Nil

    def initialize(
      @service_specific_credentials : Array(ServiceSpecificCredentialMetadata) | Nil = nil,
      @marker : String | Nil = nil,
      @is_truncated : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@service_specific_credentials || [] of ServiceSpecificCredentialMetadata).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ServiceSpecificCredentials.member.#{i}."))
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      if value = @is_truncated
        params << {"#{prefix}IsTruncated", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_specific_credentials: node.xpath_nodes("*[local-name()='ServiceSpecificCredentials']/*[local-name()='member']").map { |n| ServiceSpecificCredentialMetadata.from_xml(n) },
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
      )
    end
  end
end
