private alias AAG = Amazonite::ApiGateway
private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # Represents a REST API.
  class RestApi
    include JSON::Serializable

    # The API's identifier. This identifier is unique across all of your APIs in API Gateway.
    @[JSON::Field(key: "id")]
    property id : String | Nil

    # The API's name.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The API's description.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The timestamp when the API was created.
    @[JSON::Field(key: "createdDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # A version identifier for the API.
    @[JSON::Field(key: "version")]
    property version : String | Nil

    # The warning messages reported when `failonwarnings` is turned on during API import.
    @[JSON::Field(key: "warnings")]
    property warnings : Array(String) | Nil

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
    # >`HEADER` to read the API key from the `X-API-Key` header of a request. `AUTHORIZER` to read the
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

    # The collection of tags. Each tag element is associated with a given resource.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    # Specifies whether clients can invoke your API by using the default `execute-api` endpoint. By
    # default, clients can invoke your API with the default
    # `https://{api_id}.execute-api.{region}.amazonaws.com` endpoint. To require that clients use a
    # custom domain name to invoke your API, disable the default endpoint.
    @[JSON::Field(key: "disableExecuteApiEndpoint")]
    property disable_execute_api_endpoint : Bool | Nil

    # The API's root resource ID.
    @[JSON::Field(key: "rootResourceId")]
    property root_resource_id : String | Nil

    # The Transport Layer Security (TLS) version + cipher suite for this RestApi.
    @[JSON::Field(key: "securityPolicy", converter: AAG::SecurityPolicy)]
    property security_policy : SecurityPolicy | Nil

    # The endpoint access mode of the RestApi.
    @[JSON::Field(key: "endpointAccessMode", converter: AAG::EndpointAccessMode)]
    property endpoint_access_mode : EndpointAccessMode | Nil

    # The ApiStatus of the RestApi.
    @[JSON::Field(key: "apiStatus", converter: AAG::ApiStatus)]
    property api_status : ApiStatus | Nil

    # The status message of the RestApi. When the status message is `UPDATING` you can still invoke
    # it.
    @[JSON::Field(key: "apiStatusMessage")]
    property api_status_message : String | Nil

    def initialize(
      @id : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @version : String | Nil = nil,
      @warnings : Array(String) | Nil = nil,
      @binary_media_types : Array(String) | Nil = nil,
      @minimum_compression_size : Int32 | Nil = nil,
      @api_key_source : ApiKeySourceType | Nil = nil,
      @endpoint_configuration : EndpointConfiguration | Nil = nil,
      @policy : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
      @disable_execute_api_endpoint : Bool | Nil = nil,
      @root_resource_id : String | Nil = nil,
      @security_policy : SecurityPolicy | Nil = nil,
      @endpoint_access_mode : EndpointAccessMode | Nil = nil,
      @api_status : ApiStatus | Nil = nil,
      @api_status_message : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @endpoint_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@id, @name, @description, @created_date, @version, @warnings, @binary_media_types, @minimum_compression_size, @api_key_source, @endpoint_configuration, @policy, @tags, @disable_execute_api_endpoint, @root_resource_id, @security_policy, @endpoint_access_mode, @api_status, @api_status_message)
  end
end
