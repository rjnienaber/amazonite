private alias Core = Amazonite::Core

module Amazonite::Sns
  # Input for `SetPlatformApplicationAttributes` action.
  class SetPlatformApplicationAttributesInput
    # `PlatformApplicationArn` for `SetPlatformApplicationAttributes` action.
    property platform_application_arn : String

    # A map of the platform application attributes. Attributes in this map include the following:
    #
    # - `PlatformCredential` – The credential received from the notification service.
    #
    # - For ADM, `PlatformCredential`is client secret.
    #
    # - For Apple Services using certificate credentials, `PlatformCredential` is private key.
    #
    # - For Apple Services using token credentials, `PlatformCredential` is signing key.
    #
    # - For GCM (Firebase Cloud Messaging) using key credentials, there is no `PlatformPrincipal`. The
    # `PlatformCredential` is `API key`.
    #
    # - For GCM (Firebase Cloud Messaging) using token credentials, there is no `PlatformPrincipal`.
    # The `PlatformCredential` is a JSON formatted private key file. When using the Amazon Web
    # Services CLI, the file must be in string format and special characters must be ignored. To
    # format the file correctly, Amazon SNS recommends using the following command: `SERVICE_JSON=`jq
    # @json <<< cat service.json``.
    #
    # - `PlatformPrincipal` – The principal received from the notification service.
    #
    # - For ADM, `PlatformPrincipal`is client id.
    #
    # - For Apple Services using certificate credentials, `PlatformPrincipal` is SSL certificate.
    #
    # - For Apple Services using token credentials, `PlatformPrincipal` is signing key ID.
    #
    # - For GCM (Firebase Cloud Messaging), there is no `PlatformPrincipal`.
    #
    # - `EventEndpointCreated` – Topic ARN to which `EndpointCreated` event notifications are sent.
    #
    # - `EventEndpointDeleted` – Topic ARN to which `EndpointDeleted` event notifications are sent.
    #
    # - `EventEndpointUpdated` – Topic ARN to which `EndpointUpdate` event notifications are sent.
    #
    # - `EventDeliveryFailure` – Topic ARN to which `DeliveryFailure` event notifications are sent
    # upon Direct Publish delivery failure (permanent) to one of the application's endpoints.
    #
    # - `SuccessFeedbackRoleArn` – IAM role ARN used to give Amazon SNS write access to use CloudWatch
    # Logs on your behalf.
    #
    # - `FailureFeedbackRoleArn` – IAM role ARN used to give Amazon SNS write access to use CloudWatch
    # Logs on your behalf.
    #
    # - `SuccessFeedbackSampleRate` – Sample rate percentage (0-100) of successfully delivered
    # messages.
    #
    # The following attributes only apply to `APNs` token-based authentication:
    #
    # - `ApplePlatformTeamID` – The identifier that's assigned to your Apple developer account team.
    #
    # - `ApplePlatformBundleID` – The bundle identifier that's assigned to your iOS app.
    property attributes : Hash(String, String)

    def initialize(
      @platform_application_arn : String,
      @attributes : Hash(String, String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}PlatformApplicationArn", @platform_application_arn}

      @attributes.each_with_index(1) do |(key, value), i|
        params << {"#{prefix}Attributes.entry.#{i}.key", key}
        params << {"#{prefix}Attributes.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        platform_application_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='PlatformApplicationArn']")).not_nil!,
        attributes: node.xpath_nodes("*[local-name()='Attributes']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@platform_application_arn, @attributes)
  end
end
