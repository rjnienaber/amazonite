private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class DeleteSMSSandboxPhoneNumberInput
    property phone_number : String

    def initialize(
      @phone_number : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PhoneNumber", @phone_number}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        phone_number: Core::XMLValue.string(node.xpath_node("*[local-name()='PhoneNumber']")).not_nil!,
      )
    end
  end
end
