module Amazonite::ApiGatewayV1
  # The mutual TLS authentication configuration for a custom domain name. If specified, API Gateway
  # performs two-way authentication between the client and the server. Clients must present a
  # trusted certificate to access your API.
  class MutualTlsAuthenticationInput
    include JSON::Serializable

    # An Amazon S3 URL that specifies the truststore for mutual TLS authentication, for example
    # `s3://bucket-name/key-name`. The truststore can contain certificates from public or private
    # certificate authorities. To update the truststore, upload a new version to S3, and then update
    # your custom domain name to use the new version. To update the truststore, you must have
    # permissions to access the S3 object.
    @[JSON::Field(key: "truststoreUri")]
    property truststore_uri : String | Nil

    # The version of the S3 object that contains your truststore. To specify a version, you must have
    # versioning enabled for the S3 bucket
    @[JSON::Field(key: "truststoreVersion")]
    property truststore_version : String | Nil

    def initialize(
      @truststore_uri : String | Nil = nil,
      @truststore_version : String | Nil = nil,
    )
    end
  end
end
