private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # The POST Request to add a new RestApi resource to your collection.
  class CreateRestApiRequest
    include JSON::Serializable

    # The name of the RestApi.
    @[JSON::Field(key: "name")]
    property name : String

    # The description of the RestApi.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # A version identifier for the API.
    @[JSON::Field(key: "version")]
    property version : String | Nil

    # The ID of the RestApi that you want to clone from.
    @[JSON::Field(key: "cloneFrom")]
    property clone_from : String | Nil

    # The list of binary media types supported by the RestApi. By default, the RestApi supports only
    # UTF-8-encoded text payloads.
    @[JSON::Field(key: "binaryMediaTypes")]
    property binary_media_types : Array(String) | Nil

    # A nullable integer that is used to enable compression (with non-negative between 0 and 10485760
    # (10M) bytes, inclusive) or disable compression (with a null value) on an API. When compression
    # is enabled, compression or decompression is not applied on the payload if the payload size is
    # smaller than this value. Setting it to zero allows compression for any payload size.
    @[JSON::Field(key: "minimumCompressionSize")]
    property minimum_compression_size : Int32 | Nil

    # The source of the API key for metering requests according to a usage plan. Valid values are:
    # `HEADER` to read the API key from the `X-API-Key` header of a request. `AUTHORIZER` to read the
    # API key from the `UsageIdentifierKey` from a custom authorizer.
    @[JSON::Field(key: "apiKeySource", converter: AAG::ApiKeySourceType)]
    property api_key_source : ApiKeySourceType | Nil

    # The endpoint configuration of this RestApi showing the endpoint types and IP address types of
    # the API.
    @[JSON::Field(key: "endpointConfiguration")]
    property endpoint_configuration : EndpointConfiguration | Nil

    # A stringified JSON policy document that applies to this RestApi regardless of the caller and
    # Method configuration.
    @[JSON::Field(key: "policy")]
    property policy : String | Nil

    # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up
    # to 128 characters and must not start with `aws:`. The tag value can be up to 256 characters.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    # Specifies whether clients can invoke your API by using the default `execute-api` endpoint. By
    # default, clients can invoke your API with the default
    # `https://{api_id}.execute-api.{region}.amazonaws.com` endpoint. To require that clients use a
    # custom domain name to invoke your API, disable the default endpoint
    @[JSON::Field(key: "disableExecuteApiEndpoint")]
    property disable_execute_api_endpoint : Bool | Nil

    # The Transport Layer Security (TLS) version + cipher suite for this RestApi.
    @[JSON::Field(key: "securityPolicy", converter: AAG::SecurityPolicy)]
    property security_policy : SecurityPolicy | Nil

    # The endpoint access mode of the RestApi. Only available for RestApis that use security policies
    # that start with `SecurityPolicy_`.
    @[JSON::Field(key: "endpointAccessMode", converter: AAG::EndpointAccessMode)]
    property endpoint_access_mode : EndpointAccessMode | Nil

    def initialize(
      @name : String,
      @description : String | Nil = nil,
      @version : String | Nil = nil,
      @clone_from : String | Nil = nil,
      @binary_media_types : Array(String) | Nil = nil,
      @minimum_compression_size : Int32 | Nil = nil,
      @api_key_source : ApiKeySourceType | Nil = nil,
      @endpoint_configuration : EndpointConfiguration | Nil = nil,
      @policy : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
      @disable_execute_api_endpoint : Bool | Nil = nil,
      @security_policy : SecurityPolicy | Nil = nil,
      @endpoint_access_mode : EndpointAccessMode | Nil = nil,
    )
    end
  end
end
