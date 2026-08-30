private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class RegisterTypeOutput
    # The identifier for this registration request.
    #
    # Use this registration token when calling DescribeTypeRegistration, which returns information
    # about the status and IDs of the extension registration.
    property registration_token : String | Nil

    def initialize(
      @registration_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @registration_token
        params << {"#{prefix}RegistrationToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        registration_token: Core::XMLValue.string(node.xpath_node("*[local-name()='RegistrationToken']")),
      )
    end

    def_equals_and_hash(@registration_token)
  end
end
