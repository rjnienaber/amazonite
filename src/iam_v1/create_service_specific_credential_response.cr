private alias Core = Amazonite::Core

module Amazonite::IamV1
  class CreateServiceSpecificCredentialResponse
    # A structure that contains information about the newly created service-specific credential.
    #
    # This is the only time that the password for this credential set is available. It cannot be
    # recovered later. Instead, you must reset the password with
    # [ResetServiceSpecificCredential](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ResetServiceSpecificCredential.html).
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

    def validate! : Nil
      if value = @service_specific_credential
        value.validate!
      end
    end

    def_equals_and_hash(@service_specific_credential)
  end
end
