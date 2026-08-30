private alias AK = Amazonite::KmsV1

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

    def_equals_and_hash(@connectivity, @access_key_id, @uri_endpoint, @uri_path, @vpc_endpoint_service_name, @vpc_endpoint_service_owner)
  end
end
