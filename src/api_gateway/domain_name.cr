private alias AAG = Amazonite::ApiGateway
private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # Represents a custom domain name as a user-friendly host name of an API (RestApi).
  class DomainName
    include JSON::Serializable

    # The custom domain name as an API host name, for example, `my-api.example.com`.
    @[JSON::Field(key: "domainName")]
    property domain_name : String | Nil

    # The identifier for the domain name resource. Supported only for private custom domain names.
    @[JSON::Field(key: "domainNameId")]
    property domain_name_id : String | Nil

    # The ARN of the domain name.
    @[JSON::Field(key: "domainNameArn")]
    property domain_name_arn : String | Nil

    # The name of the certificate that will be used by edge-optimized endpoint or private endpoint for
    # this domain name.
    @[JSON::Field(key: "certificateName")]
    property certificate_name : String | Nil

    # The reference to an Amazon Web Services-managed certificate that will be used by edge-optimized
    # endpoint or private endpoint for this domain name. Certificate Manager is the only supported
    # source.
    @[JSON::Field(key: "certificateArn")]
    property certificate_arn : String | Nil

    # The timestamp when the certificate that was used by edge-optimized endpoint or private endpoint
    # for this domain name was uploaded.
    @[JSON::Field(key: "certificateUploadDate", converter: Core::AWSEpochConverter)]
    property certificate_upload_date : Time | Nil

    # The domain name associated with the regional endpoint for this custom domain name. You set up
    # this association by adding a DNS record that points the custom domain name to this regional
    # domain name. The regional domain name is returned by API Gateway when you create a regional
    # endpoint.
    @[JSON::Field(key: "regionalDomainName")]
    property regional_domain_name : String | Nil

    # The region-specific Amazon Route 53 Hosted Zone ID of the regional endpoint. For more
    # information, see Set up a Regional Custom Domain Name and AWS Regions and Endpoints for API
    # Gateway.
    @[JSON::Field(key: "regionalHostedZoneId")]
    property regional_hosted_zone_id : String | Nil

    # The name of the certificate that will be used for validating the regional domain name.
    @[JSON::Field(key: "regionalCertificateName")]
    property regional_certificate_name : String | Nil

    # The reference to an Amazon Web Services-managed certificate that will be used for validating the
    # regional domain name. Certificate Manager is the only supported source.
    @[JSON::Field(key: "regionalCertificateArn")]
    property regional_certificate_arn : String | Nil

    # The domain name of the Amazon CloudFront distribution associated with this custom domain name
    # for an edge-optimized endpoint. You set up this association when adding a DNS record pointing
    # the custom domain name to this distribution name. For more information about CloudFront
    # distributions, see the Amazon CloudFront documentation.
    @[JSON::Field(key: "distributionDomainName")]
    property distribution_domain_name : String | Nil

    # The region-agnostic Amazon Route 53 Hosted Zone ID of the edge-optimized endpoint. The valid
    # value is `Z2FDTNDATAQYW2` for all the regions. For more information, see Set up a Regional
    # Custom Domain Name and AWS Regions and Endpoints for API Gateway.
    @[JSON::Field(key: "distributionHostedZoneId")]
    property distribution_hosted_zone_id : String | Nil

    # The endpoint configuration of this DomainName showing the endpoint types and IP address types of
    # the domain name.
    @[JSON::Field(key: "endpointConfiguration")]
    property endpoint_configuration : EndpointConfiguration | Nil

    # The status of the DomainName migration. The valid values are `AVAILABLE` and `UPDATING`. If the
    # status is `UPDATING`, the domain cannot be modified further until the existing operation is
    # complete. If it is `AVAILABLE`, the domain can be updated.
    @[JSON::Field(key: "domainNameStatus", converter: AAG::DomainNameStatus)]
    property domain_name_status : DomainNameStatus | Nil

    # An optional text message containing detailed information about status of the DomainName
    # migration.
    @[JSON::Field(key: "domainNameStatusMessage")]
    property domain_name_status_message : String | Nil

    # The Transport Layer Security (TLS) version + cipher suite for this DomainName.
    @[JSON::Field(key: "securityPolicy", converter: AAG::SecurityPolicy)]
    property security_policy : SecurityPolicy | Nil

    # The endpoint access mode of the DomainName.
    @[JSON::Field(key: "endpointAccessMode", converter: AAG::EndpointAccessMode)]
    property endpoint_access_mode : EndpointAccessMode | Nil

    # The collection of tags. Each tag element is associated with a given resource.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    # The mutual TLS authentication configuration for a custom domain name. If specified, API Gateway
    # performs two-way authentication between the client and the server. Clients must present a
    # trusted certificate to access your API.
    @[JSON::Field(key: "mutualTlsAuthentication")]
    property mutual_tls_authentication : MutualTlsAuthentication | Nil

    # The ARN of the public certificate issued by ACM to validate ownership of your custom domain.
    # Only required when configuring mutual TLS and using an ACM imported or private CA certificate
    # ARN as the regionalCertificateArn.
    @[JSON::Field(key: "ownershipVerificationCertificateArn")]
    property ownership_verification_certificate_arn : String | Nil

    # A stringified JSON policy document that applies to the API Gateway Management service for this
    # DomainName. This policy document controls access for access association sources to create domain
    # name access associations with this DomainName. Supported only for private custom domain names.
    @[JSON::Field(key: "managementPolicy")]
    property management_policy : String | Nil

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
      @domain_name : String | Nil = nil,
      @domain_name_id : String | Nil = nil,
      @domain_name_arn : String | Nil = nil,
      @certificate_name : String | Nil = nil,
      @certificate_arn : String | Nil = nil,
      @certificate_upload_date : Time | Nil = nil,
      @regional_domain_name : String | Nil = nil,
      @regional_hosted_zone_id : String | Nil = nil,
      @regional_certificate_name : String | Nil = nil,
      @regional_certificate_arn : String | Nil = nil,
      @distribution_domain_name : String | Nil = nil,
      @distribution_hosted_zone_id : String | Nil = nil,
      @endpoint_configuration : EndpointConfiguration | Nil = nil,
      @domain_name_status : DomainNameStatus | Nil = nil,
      @domain_name_status_message : String | Nil = nil,
      @security_policy : SecurityPolicy | Nil = nil,
      @endpoint_access_mode : EndpointAccessMode | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
      @mutual_tls_authentication : MutualTlsAuthentication | Nil = nil,
      @ownership_verification_certificate_arn : String | Nil = nil,
      @management_policy : String | Nil = nil,
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

    def_equals_and_hash(@domain_name, @domain_name_id, @domain_name_arn, @certificate_name, @certificate_arn, @certificate_upload_date, @regional_domain_name, @regional_hosted_zone_id, @regional_certificate_name, @regional_certificate_arn, @distribution_domain_name, @distribution_hosted_zone_id, @endpoint_configuration, @domain_name_status, @domain_name_status_message, @security_policy, @endpoint_access_mode, @tags, @mutual_tls_authentication, @ownership_verification_certificate_arn, @management_policy, @policy, @routing_mode)
  end
end
