private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class CreatePlatformEndpointInput
    property platform_application_arn : String

    property token : String

    property custom_user_data : String | Nil

    property attributes : Hash(String, String) | Nil

    def initialize(
      @platform_application_arn : String,
      @token : String,
      @custom_user_data : String | Nil = nil,
      @attributes : Hash(String, String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PlatformApplicationArn", @platform_application_arn}

      params << {"#{prefix}Token", @token}

      if value = @custom_user_data
        params << {"#{prefix}CustomUserData", value}
      end

      (@attributes || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}Attributes.entry.#{i}.key", key}
        params << {"#{prefix}Attributes.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        platform_application_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PlatformApplicationArn']")).not_nil!,
        token: Core::XMLValue.string(node.xpath_node("*[local-name()='Token']")).not_nil!,
        custom_user_data: Core::XMLValue.string(node.xpath_node("*[local-name()='CustomUserData']")),
        attributes: node.xpath_nodes("*[local-name()='Attributes']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end
  end
end
