private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  # Detailed information about the external key store proxy (XKS proxy). Your external key store
  # proxy translates KMS requests into a format that your external key manager can understand. These
  # fields appear in a DescribeCustomKeyStores response only when the `CustomKeyStoreType` is
  # `EXTERNAL_KEY_STORE`.
  class XksProxyConfigurationType
    include JSON::Serializable

    # Indicates whether the external key store proxy uses a public endpoint or an Amazon VPC endpoint
    # service to communicate with KMS.
    @[JSON::Field(key: "Connectivity", converter: AK::XksProxyConnectivityType)]
    property connectivity : XksProxyConnectivityType | Nil

    # The part of the external key store [proxy authentication
    # credential](https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateCustomKeyStore.html#KMS-CreateCustomKeyStore-request-XksProxyAuthenticationCredential)
    # that uniquely identifies the secret access key.
    @[JSON::Field(key: "AccessKeyId")]
    property access_key_id : String | Nil

    # The URI endpoint for the external key store proxy.
    #
    # If the external key store proxy has a public endpoint, it is displayed here.
    #
    # If the external key store proxy uses an Amazon VPC endpoint service name, this field displays
    # the private DNS name associated with the VPC endpoint service.
    @[JSON::Field(key: "UriEndpoint")]
    property uri_endpoint : String | Nil

    # The path to the external key store proxy APIs.
    @[JSON::Field(key: "UriPath")]
    property uri_path : String | Nil

    # The Amazon VPC endpoint service used to communicate with the external key store proxy. This
    # field appears only when the external key store proxy uses an Amazon VPC endpoint service to
    # communicate with KMS.
    @[JSON::Field(key: "VpcEndpointServiceName")]
    property vpc_endpoint_service_name : String | Nil

    # The Amazon Web Services account ID that owns the Amazon VPC endpoint service used to communicate
    # with the external key store proxy (XKS). This field appears only when the XKS uses an VPC
    # endpoint service to communicate with KMS.
    @[JSON::Field(key: "VpcEndpointServiceOwner")]
    property vpc_endpoint_service_owner : String | Nil

    def initialize(
      @connectivity : XksProxyConnectivityType | Nil = nil,
      @access_key_id : String | Nil = nil,
      @uri_endpoint : String | Nil = nil,
      @uri_path : String | Nil = nil,
      @vpc_endpoint_service_name : String | Nil = nil,
      @vpc_endpoint_service_owner : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @access_key_id
        raise Core::ValidationError.new("AccessKeyId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("AccessKeyId length must be <= 30") if value.size > 30
        raise Core::ValidationError.new("AccessKeyId does not match the required pattern") unless value.matches?(Regex.new("^[A-Z2-7]+$"))
      end

      if value = @uri_endpoint
        raise Core::ValidationError.new("UriEndpoint length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("UriEndpoint length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("UriEndpoint does not match the required pattern") unless value.matches?(Regex.new("^https://[a-zA-Z0-9.-]+$"))
      end

      if value = @uri_path
        raise Core::ValidationError.new("UriPath length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("UriPath length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("UriPath does not match the required pattern") unless value.matches?(Regex.new("^(/[a-zA-Z0-9\\/_-]+/kms/xks/v\\d{1,2})$|^(/kms/xks/v\\d{1,2})$"))
      end

      if value = @vpc_endpoint_service_name
        raise Core::ValidationError.new("VpcEndpointServiceName length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("VpcEndpointServiceName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("VpcEndpointServiceName does not match the required pattern") unless value.matches?(Regex.new("^(com|eu)\\.amazonaws\\.vpce\\.([a-z]+-){2,3}\\d+\\.vpce-svc-[0-9a-z]+$"))
      end

      if value = @vpc_endpoint_service_owner
        raise Core::ValidationError.new("VpcEndpointServiceOwner length must be >= 12") if value.size < 12
        raise Core::ValidationError.new("VpcEndpointServiceOwner length must be <= 12") if value.size > 12
        raise Core::ValidationError.new("VpcEndpointServiceOwner does not match the required pattern") unless value.matches?(Regex.new("^[0-9]{12}$"))
      end
    end

    def_equals_and_hash(@connectivity, @access_key_id, @uri_endpoint, @uri_path, @vpc_endpoint_service_name, @vpc_endpoint_service_owner)
  end
end
