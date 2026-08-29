private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ResyncMFADeviceRequest
    property user_name : String

    property serial_number : String

    property authentication_code_1 : String

    property authentication_code_2 : String

    def initialize(
      @user_name : String,
      @serial_number : String,
      @authentication_code_1 : String,
      @authentication_code_2 : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}SerialNumber", @serial_number}

      params << {"#{prefix}AuthenticationCode1", @authentication_code_1}

      params << {"#{prefix}AuthenticationCode2", @authentication_code_2}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
        authentication_code_1: Core::XMLValue.string(node.xpath_node("*[local-name()='AuthenticationCode1']")).not_nil!,
        authentication_code_2: Core::XMLValue.string(node.xpath_node("*[local-name()='AuthenticationCode2']")).not_nil!,
      )
    end
  end
end
