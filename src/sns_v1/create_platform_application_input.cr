private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Input for CreatePlatformApplication action.
  class CreatePlatformApplicationInput
    # Application names must be made up of only uppercase and lowercase ASCII letters, numbers,
    # underscores, hyphens, and periods, and must be between 1 and 256 characters long.
    property name : String

    # The following platforms are supported: ADM (Amazon Device Messaging), APNS (Apple Push
    # Notification Service), APNS_SANDBOX, and GCM (Firebase Cloud Messaging).
    property platform : String

    # For a list of attributes, see [ `SetPlatformApplicationAttributes`
    # ](https://docs.aws.amazon.com/sns/latest/api/API_SetPlatformApplicationAttributes.html).
    property attributes : Hash(String, String)

    def initialize(
      @name : String,
      @platform : String,
      @attributes : Hash(String, String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Name", @name}

      params << {"#{prefix}Platform", @platform}

      @attributes.each_with_index(1) do |(key, value), i|
        params << {"#{prefix}Attributes.entry.#{i}.key", key}
        params << {"#{prefix}Attributes.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")).not_nil!,
        platform: Core::XMLValue.string(node.xpath_node("*[local-name()='Platform']")).not_nil!,
        attributes: node.xpath_nodes("*[local-name()='Attributes']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end

    def_equals_and_hash(@name, @platform, @attributes)
  end
end
