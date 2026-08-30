module Amazonite::IamV1
  class ResetServiceSpecificCredentialResponse
    # A structure with details about the updated service-specific credential, including the new
    # password.
    #
    # This is the **only** time that you can access the password. You cannot recover the password
    # later, but you can reset it again.
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

    def_equals_and_hash(@service_specific_credential)
  end
end
