private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetMFADeviceRequest
    property serial_number : String

    property user_name : String | Nil

    def initialize(
      @serial_number : String,
      @user_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SerialNumber", @serial_number}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
      )
    end
  end
end
