private alias Core = Amazonite::Core

module Amazonite::IamV1
  class MFADevice
    property user_name : String

    property serial_number : String

    property enable_date : Time

    def initialize(
      @user_name : String,
      @serial_number : String,
      @enable_date : Time,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}SerialNumber", @serial_number}

      params << {"#{prefix}EnableDate", Core::QueryValue.time(@enable_date)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
        enable_date: Core::XMLValue.time(node.xpath_node("*[local-name()='EnableDate']")).not_nil!,
      )
    end
  end
end
