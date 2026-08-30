private alias Core = Amazonite::Core

module Amazonite::SnsV1
  # Input for CreatePlatformEndpoint action.
  class CreatePlatformEndpointInput
    # `PlatformApplicationArn` returned from CreatePlatformApplication is used to create a an
    # endpoint.
    property platform_application_arn : String

    # Unique identifier created by the notification service for an app on a device. The specific name
    # for Token will vary, depending on which notification service is being used. For example, when
    # using APNS as the notification service, you need the device token. Alternatively, when using GCM
    # (Firebase Cloud Messaging) or ADM, the device token equivalent is called the registration ID.
    property token : String

    # Arbitrary user data to associate with the endpoint. Amazon SNS does not use this data. The data
    # must be in UTF-8 format and less than 2KB.
    property custom_user_data : String | Nil

    # For a list of attributes, see [ `SetEndpointAttributes`
    # ](https://docs.aws.amazon.com/sns/latest/api/API_SetEndpointAttributes.html).
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

    def_equals_and_hash(@platform_application_arn, @token, @custom_user_data, @attributes)
  end
end
