private alias AK = Amazonite::KmsV1
private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class UpdateCustomKeyStoreRequest
    include JSON::Serializable

    # Identifies the custom key store that you want to update. Enter the ID of the custom key store.
    # To find the ID of a custom key store, use the DescribeCustomKeyStores operation.
    @[JSON::Field(key: "CustomKeyStoreId")]
    property custom_key_store_id : String

    # Changes the friendly name of the custom key store to the value that you specify. The custom key
    # store name must be unique in the Amazon Web Services account.
    #
    # Do not include confidential or sensitive information in this field. This field may be displayed
    # in plaintext in CloudTrail logs and other output.
    #
    # To change this value, the custom key store can be connected or disconnected.
    @[JSON::Field(key: "NewCustomKeyStoreName")]
    property new_custom_key_store_name : String | Nil

    # Enter the current password of the `kmsuser` crypto user (CU) in the CloudHSM cluster that is
    # associated with the custom key store. This parameter is valid only for custom key stores with a
    # `CustomKeyStoreType` of `AWS_CLOUDHSM`.
    #
    # This parameter tells KMS the current password of the `kmsuser` crypto user (CU). It does not set
    # or change the password of any users in the CloudHSM cluster.
    #
    # To change this value, the CloudHSM key store must be disconnected.
    @[JSON::Field(key: "KeyStorePassword")]
    property key_store_password : String | Nil

    # Associates the custom key store with a related CloudHSM cluster. This parameter is valid only
    # for custom key stores with a `CustomKeyStoreType` of `AWS_CLOUDHSM`.
    #
    # Enter the cluster ID of the cluster that you used to create the custom key store or a cluster
    # that shares a backup history and has the same cluster certificate as the original cluster. You
    # cannot use this parameter to associate a custom key store with an unrelated cluster. In
    # addition, the replacement cluster must [fulfill the
    # requirements](https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore)
    # for a cluster associated with a custom key store. To view the cluster certificate of a cluster,
    # use the
    # [DescribeClusters](https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html)
    # operation.
    #
    # To change this value, the CloudHSM key store must be disconnected.
    @[JSON::Field(key: "CloudHsmClusterId")]
    property cloud_hsm_cluster_id : String | Nil

    # Changes the URI endpoint that KMS uses to connect to your external key store proxy (XKS proxy).
    # This parameter is valid only for custom key stores with a `CustomKeyStoreType` of
    # `EXTERNAL_KEY_STORE`.
    #
    # For external key stores with an `XksProxyConnectivity` value of `PUBLIC_ENDPOINT`, the protocol
    # must be HTTPS.
    #
    # For external key stores with an `XksProxyConnectivity` value of `VPC_ENDPOINT_SERVICE`, specify
    # `https://` followed by the private DNS name associated with the VPC endpoint service. Each
    # external key store must use a different private DNS name.
    #
    # The combined `XksProxyUriEndpoint` and `XksProxyUriPath` values must be unique in the Amazon Web
    # Services account and Region.
    #
    # To change this value, the external key store must be disconnected.
    @[JSON::Field(key: "XksProxyUriEndpoint")]
    property xks_proxy_uri_endpoint : String | Nil

    # Changes the base path to the proxy APIs for this external key store. To find this value, see the
    # documentation for your external key manager and external key store proxy (XKS proxy). This
    # parameter is valid only for custom key stores with a `CustomKeyStoreType` of
    # `EXTERNAL_KEY_STORE`.
    #
    # The value must start with `/` and must end with `/kms/xks/v1`, where `v1` represents the version
    # of the KMS external key store proxy API. You can include an optional prefix between the required
    # elements such as `/*example*/kms/xks/v1`.
    #
    # The combined `XksProxyUriEndpoint` and `XksProxyUriPath` values must be unique in the Amazon Web
    # Services account and Region.
    #
    # You can change this value when the external key store is connected or disconnected.
    @[JSON::Field(key: "XksProxyUriPath")]
    property xks_proxy_uri_path : String | Nil

    # Changes the name that KMS uses to identify the Amazon VPC endpoint service for your external key
    # store proxy (XKS proxy). This parameter is valid when the `CustomKeyStoreType` is
    # `EXTERNAL_KEY_STORE` and the `XksProxyConnectivity` is `VPC_ENDPOINT_SERVICE`.
    #
    # To change this value, the external key store must be disconnected.
    @[JSON::Field(key: "XksProxyVpcEndpointServiceName")]
    property xks_proxy_vpc_endpoint_service_name : String | Nil

    # Changes the Amazon Web Services account ID that KMS uses to identify the Amazon VPC endpoint
    # service for your external key store proxy (XKS proxy). This parameter is optional. If not
    # specified, the current Amazon Web Services account ID for the VPC endpoint service will not be
    # updated.
    #
    # To change this value, the external key store must be disconnected.
    @[JSON::Field(key: "XksProxyVpcEndpointServiceOwner")]
    property xks_proxy_vpc_endpoint_service_owner : String | Nil

    # Changes the credentials that KMS uses to sign requests to the external key store proxy (XKS
    # proxy). This parameter is valid only for custom key stores with a `CustomKeyStoreType` of
    # `EXTERNAL_KEY_STORE`.
    #
    # You must specify both the `AccessKeyId` and `SecretAccessKey` value in the authentication
    # credential, even if you are only updating one value.
    #
    # This parameter doesn't establish or change your authentication credentials on the proxy. It just
    # tells KMS the credential that you established with your external key store proxy. For example,
    # if you rotate the credential on your external key store proxy, you can use this parameter to
    # update the credential in KMS.
    #
    # You can change this value when the external key store is connected or disconnected.
    @[JSON::Field(key: "XksProxyAuthenticationCredential")]
    property xks_proxy_authentication_credential : XksProxyAuthenticationCredentialType | Nil

    # Changes the connectivity setting for the external key store. To indicate that the external key
    # store proxy uses a Amazon VPC endpoint service to communicate with KMS, specify
    # `VPC_ENDPOINT_SERVICE`. Otherwise, specify `PUBLIC_ENDPOINT`.
    #
    # If you change the `XksProxyConnectivity` to `VPC_ENDPOINT_SERVICE`, you must also change the
    # `XksProxyUriEndpoint` and add an `XksProxyVpcEndpointServiceName` value.
    #
    # If you change the `XksProxyConnectivity` to `PUBLIC_ENDPOINT`, you must also change the
    # `XksProxyUriEndpoint` and specify a null or empty string for the
    # `XksProxyVpcEndpointServiceName` value.
    #
    # To change this value, the external key store must be disconnected.
    @[JSON::Field(key: "XksProxyConnectivity", converter: AK::XksProxyConnectivityType)]
    property xks_proxy_connectivity : XksProxyConnectivityType | Nil

    def initialize(
      @custom_key_store_id : String,
      @new_custom_key_store_name : String | Nil = nil,
      @key_store_password : String | Nil = nil,
      @cloud_hsm_cluster_id : String | Nil = nil,
      @xks_proxy_uri_endpoint : String | Nil = nil,
      @xks_proxy_uri_path : String | Nil = nil,
      @xks_proxy_vpc_endpoint_service_name : String | Nil = nil,
      @xks_proxy_vpc_endpoint_service_owner : String | Nil = nil,
      @xks_proxy_authentication_credential : XksProxyAuthenticationCredentialType | Nil = nil,
      @xks_proxy_connectivity : XksProxyConnectivityType | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @custom_key_store_id
        raise Core::ValidationError.new("CustomKeyStoreId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CustomKeyStoreId length must be <= 64") if value.size > 64
      end

      if value = @new_custom_key_store_name
        raise Core::ValidationError.new("NewCustomKeyStoreName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NewCustomKeyStoreName length must be <= 256") if value.size > 256
      end

      if value = @key_store_password
        raise Core::ValidationError.new("KeyStorePassword length must be >= 7") if value.size < 7
        raise Core::ValidationError.new("KeyStorePassword length must be <= 32") if value.size > 32
      end

      if value = @cloud_hsm_cluster_id
        raise Core::ValidationError.new("CloudHsmClusterId length must be >= 19") if value.size < 19
        raise Core::ValidationError.new("CloudHsmClusterId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("CloudHsmClusterId does not match the required pattern") unless value.matches?(Regex.new("^cluster-[2-7a-zA-Z]{11,16}$"))
      end

      if value = @xks_proxy_uri_endpoint
        raise Core::ValidationError.new("XksProxyUriEndpoint length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("XksProxyUriEndpoint length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("XksProxyUriEndpoint does not match the required pattern") unless value.matches?(Regex.new("^https://[a-zA-Z0-9.-]+$"))
      end

      if value = @xks_proxy_uri_path
        raise Core::ValidationError.new("XksProxyUriPath length must be >= 10") if value.size < 10
        raise Core::ValidationError.new("XksProxyUriPath length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("XksProxyUriPath does not match the required pattern") unless value.matches?(Regex.new("^(/[a-zA-Z0-9\\/_-]+/kms/xks/v\\d{1,2})$|^(/kms/xks/v\\d{1,2})$"))
      end

      if value = @xks_proxy_vpc_endpoint_service_name
        raise Core::ValidationError.new("XksProxyVpcEndpointServiceName length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("XksProxyVpcEndpointServiceName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("XksProxyVpcEndpointServiceName does not match the required pattern") unless value.matches?(Regex.new("^(com|eu)\\.amazonaws\\.vpce\\.([a-z]+-){2,3}\\d+\\.vpce-svc-[0-9a-z]+$"))
      end

      if value = @xks_proxy_vpc_endpoint_service_owner
        raise Core::ValidationError.new("XksProxyVpcEndpointServiceOwner length must be >= 12") if value.size < 12
        raise Core::ValidationError.new("XksProxyVpcEndpointServiceOwner length must be <= 12") if value.size > 12
        raise Core::ValidationError.new("XksProxyVpcEndpointServiceOwner does not match the required pattern") unless value.matches?(Regex.new("^[0-9]{12}$"))
      end

      if value = @xks_proxy_authentication_credential
        value.validate!
      end
    end

    def_equals_and_hash(@custom_key_store_id, @new_custom_key_store_name, @key_store_password, @cloud_hsm_cluster_id, @xks_proxy_uri_endpoint, @xks_proxy_uri_path, @xks_proxy_vpc_endpoint_service_name, @xks_proxy_vpc_endpoint_service_owner, @xks_proxy_authentication_credential, @xks_proxy_connectivity)
  end
end
