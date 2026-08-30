private alias AAG = Amazonite::ApiGatewayV1
private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # A request to create a new domain name.
  class CreateDomainNameRequest
    include JSON::Serializable

    # The name of the DomainName resource.
    @[JSON::Field(key: "domainName")]
    property domain_name : String

    # The user-friendly name of the certificate that will be used by edge-optimized endpoint or
    # private endpoint for this domain name.
    @[JSON::Field(key: "certificateName")]
    property certificate_name : String | Nil

    # [Deprecated] The body of the server certificate that will be used by edge-optimized endpoint or
    # private endpoint for this domain name provided by your certificate authority.
    @[JSON::Field(key: "certificateBody")]
    property certificate_body : String | Nil

    # [Deprecated] Your edge-optimized endpoint's domain name certificate's private key.
    @[JSON::Field(key: "certificatePrivateKey")]
    property certificate_private_key : String | Nil

    # [Deprecated] The intermediate certificates and optionally the root certificate, one after the
    # other without any blank lines, used by an edge-optimized endpoint for this domain name. If you
    # include the root certificate, your certificate chain must start with intermediate certificates
    # and end with the root certificate. Use the intermediate certificates that were provided by your
    # certificate authority. Do not include any intermediaries that are not in the chain of trust
    # path.
    @[JSON::Field(key: "certificateChain")]
    property certificate_chain : String | Nil

    # The reference to an Amazon Web Services-managed certificate that will be used by edge-optimized
    # endpoint or private endpoint for this domain name. Certificate Manager is the only supported
    # source.
    @[JSON::Field(key: "certificateArn")]
    property certificate_arn : String | Nil

    # The user-friendly name of the certificate that will be used by regional endpoint for this domain
    # name.
    @[JSON::Field(key: "regionalCertificateName")]
    property regional_certificate_name : String | Nil

    # The reference to an Amazon Web Services-managed certificate that will be used by regional
    # endpoint for this domain name. Certificate Manager is the only supported source.
    @[JSON::Field(key: "regionalCertificateArn")]
    property regional_certificate_arn : String | Nil

    # The endpoint configuration of this DomainName showing the endpoint types and IP address types of
    # the domain name.
    @[JSON::Field(key: "endpointConfiguration")]
    property endpoint_configuration : EndpointConfiguration | Nil

    # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up
    # to 128 characters and must not start with `aws:`. The tag value can be up to 256 characters.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    # The Transport Layer Security (TLS) version + cipher suite for this DomainName.
    @[JSON::Field(key: "securityPolicy", converter: AAG::SecurityPolicy)]
    property security_policy : SecurityPolicy | Nil

    # The endpoint access mode of the DomainName. Only available for DomainNames that use security
    # policies that start with `SecurityPolicy_`.
    @[JSON::Field(key: "endpointAccessMode", converter: AAG::EndpointAccessMode)]
    property endpoint_access_mode : EndpointAccessMode | Nil

    @[JSON::Field(key: "mutualTlsAuthentication")]
    property mutual_tls_authentication : MutualTlsAuthenticationInput | Nil

    # The ARN of the public certificate issued by ACM to validate ownership of your custom domain.
    # Only required when configuring mutual TLS and using an ACM imported or private CA certificate
    # ARN as the regionalCertificateArn.
    @[JSON::Field(key: "ownershipVerificationCertificateArn")]
    property ownership_verification_certificate_arn : String | Nil

    # A stringified JSON policy document that applies to the `execute-api` service for this DomainName
    # regardless of the caller and Method configuration. Supported only for private custom domain
    # names.
    @[JSON::Field(key: "policy")]
    property policy : String | Nil

    # The routing mode for this domain name. The routing mode determines how API Gateway sends traffic
    # from your custom domain name to your private APIs.
    @[JSON::Field(key: "routingMode", converter: AAG::RoutingMode)]
    property routing_mode : RoutingMode | Nil

    def initialize(
      @domain_name : String,
      @certificate_name : String | Nil = nil,
      @certificate_body : String | Nil = nil,
      @certificate_private_key : String | Nil = nil,
      @certificate_chain : String | Nil = nil,
      @certificate_arn : String | Nil = nil,
      @regional_certificate_name : String | Nil = nil,
      @regional_certificate_arn : String | Nil = nil,
      @endpoint_configuration : EndpointConfiguration | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
      @security_policy : SecurityPolicy | Nil = nil,
      @endpoint_access_mode : EndpointAccessMode | Nil = nil,
      @mutual_tls_authentication : MutualTlsAuthenticationInput | Nil = nil,
      @ownership_verification_certificate_arn : String | Nil = nil,
      @policy : String | Nil = nil,
      @routing_mode : RoutingMode | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @endpoint_configuration
        value.validate!
      end

      if value = @mutual_tls_authentication
        value.validate!
      end
    end

    def_equals_and_hash(@domain_name, @certificate_name, @certificate_body, @certificate_private_key, @certificate_chain, @certificate_arn, @regional_certificate_name, @regional_certificate_arn, @endpoint_configuration, @tags, @security_policy, @endpoint_access_mode, @mutual_tls_authentication, @ownership_verification_certificate_arn, @policy, @routing_mode)
  end
end
