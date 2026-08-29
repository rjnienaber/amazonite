module Amazonite::IamV1
  class CreateServiceSpecificCredentialResponse
    property service_specific_credential : ServiceSpecificCredential | Nil

    def initialize(
      @service_specific_credential : ServiceSpecificCredential | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @service_specific_credential
        params.concat(value.to_query_params("#{prefix}ServiceSpecificCredential."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_specific_credential: node.xpath_node("*[local-name()='ServiceSpecificCredential']").try { |n| ServiceSpecificCredential.from_xml(n) },
      )
    end
  end
end
