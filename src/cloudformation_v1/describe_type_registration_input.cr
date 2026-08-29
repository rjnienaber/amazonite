private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DescribeTypeRegistrationInput
    property registration_token : String

    def initialize(
      @registration_token : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}RegistrationToken", @registration_token}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        registration_token: Core::XMLValue.string(node.xpath_node("*[local-name()='RegistrationToken']")).not_nil!,
      )
    end
  end
end
