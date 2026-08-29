private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetMFADeviceResponse
    property user_name : String | Nil

    property serial_number : String

    property enable_date : Time | Nil

    property certifications : Hash(String, String) | Nil

    def initialize(
      @serial_number : String,
      @user_name : String | Nil = nil,
      @enable_date : Time | Nil = nil,
      @certifications : Hash(String, String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      params << {"#{prefix}SerialNumber", @serial_number}

      if value = @enable_date
        params << {"#{prefix}EnableDate", Core::QueryValue.time(value)}
      end

      (@certifications || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}Certifications.entry.#{i}.key", key}
        params << {"#{prefix}Certifications.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        serial_number: Core::XMLValue.string(node.xpath_node("*[local-name()='SerialNumber']")).not_nil!,
        enable_date: Core::XMLValue.time(node.xpath_node("*[local-name()='EnableDate']")),
        certifications: node.xpath_nodes("*[local-name()='Certifications']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end
  end
end
