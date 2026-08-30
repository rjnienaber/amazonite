module Amazonite::SnsV1
  # Response for `GetPlatformApplicationAttributes` action.
  class GetPlatformApplicationAttributesResponse
    # Attributes include the following:
    #
    # - `AppleCertificateExpiryDate` – The expiry date of the SSL certificate used to configure
    # certificate-based authentication.
    #
    # - `ApplePlatformTeamID` – The Apple developer account ID used to configure token-based
    # authentication.
    #
    # - `ApplePlatformBundleID` – The app identifier used to configure token-based authentication.
    #
    # - `AuthenticationMethod` – Returns the credential type used when sending push notifications from
    # application to APNS/APNS_Sandbox, or application to GCM.
    #
    # - APNS – Returns the token or certificate.
    #
    # - GCM – Returns the token or key.
    #
    # - `EventEndpointCreated` – Topic ARN to which EndpointCreated event notifications should be
    # sent.
    #
    # - `EventEndpointDeleted` – Topic ARN to which EndpointDeleted event notifications should be
    # sent.
    #
    # - `EventEndpointUpdated` – Topic ARN to which EndpointUpdate event notifications should be sent.
    #
    # - `EventDeliveryFailure` – Topic ARN to which DeliveryFailure event notifications should be sent
    # upon Direct Publish delivery failure (permanent) to one of the application's endpoints.
    property attributes : Hash(String, String) | Nil

    def initialize(
      @attributes : Hash(String, String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@attributes || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}Attributes.entry.#{i}.key", key}
        params << {"#{prefix}Attributes.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attributes: node.xpath_nodes("*[local-name()='Attributes']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@attributes)
  end
end
