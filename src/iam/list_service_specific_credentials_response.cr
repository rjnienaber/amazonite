private alias Core = Amazonite::Core

module Amazonite::Iam
  class ListServiceSpecificCredentialsResponse
    # A list of structures that each contain details about a service-specific credential.
    property service_specific_credentials : Array(ServiceSpecificCredentialMetadata) | Nil

    # When IsTruncated is true, this element is present and contains the value to use for the Marker
    # parameter in a subsequent pagination request.
    property marker : String | Nil

    # A flag that indicates whether there are more items to return. If your results were truncated,
    # you can make a subsequent pagination request using the Marker request parameter to retrieve more
    # items.
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

    def validate! : Nil
      if value = @service_specific_credentials
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@service_specific_credentials, @marker, @is_truncated)
  end
end
