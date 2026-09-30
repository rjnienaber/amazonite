private alias Core = Amazonite::Core

module Amazonite::Iam
  class ResetServiceSpecificCredentialRequest
    # The name of the IAM user associated with the service-specific credential. If this value is not
    # specified, then the operation assumes the user whose credentials are used to call the operation.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String | Nil

    # The unique identifier of the service-specific credential.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters that can consist of any upper or lowercased letter or digit.
    property service_specific_credential_id : String

    def initialize(
      @service_specific_credential_id : String,
      @user_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      params << {"#{prefix}ServiceSpecificCredentialId", @service_specific_credential_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        service_specific_credential_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceSpecificCredentialId']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @service_specific_credential_id
        raise Core::ValidationError.new("ServiceSpecificCredentialId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ServiceSpecificCredentialId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ServiceSpecificCredentialId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end
    end

    def_equals_and_hash(@user_name, @service_specific_credential_id)
  end
end
