private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # Sets up a method's integration.
  class PutIntegrationRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # Specifies a put integration request's resource ID.
    @[JSON::Field(key: "resourceId", ignore: true)]
    property resource_id : String = ""

    # Specifies the HTTP method for the integration.
    @[JSON::Field(key: "requestHttpMethod", ignore: true)]
    property http_method : String = ""

    # Specifies a put integration input's type.
    @[JSON::Field(key: "type", converter: AAG::IntegrationType)]
    property type : IntegrationType

    # The HTTP method for the integration.
    @[JSON::Field(key: "httpMethod")]
    property integration_http_method : String | Nil

    # Specifies Uniform Resource Identifier (URI) of the integration endpoint. For HTTP or
    # `HTTP_PROXY` integrations, the URI must be a fully formed, encoded HTTP(S) URL according to the
    # RFC-3986 specification, for either standard integration, where `connectionType` is not
    # `VPC_LINK`, or private integration, where `connectionType` is `VPC_LINK`. For a private HTTP
    # integration, the URI is not used for routing. For `AWS` or `AWS_PROXY` integrations, the URI is
    # of the form `arn:aws:apigateway:{region}:{subdomain.service|service}:path|action/{service_api`}.
    # Here, {Region} is the API Gateway region (e.g., us-east-1); {service} is the name of the
    # integrated Amazon Web Services service (e.g., s3); and {subdomain} is a designated subdomain
    # supported by certain Amazon Web Services service for fast host-name lookup. action can be used
    # for an Amazon Web Services service action-based API, using an Action={name}&{p1}={v1}&p2={v2}...
    # query string. The ensuing {service_api} refers to a supported action {name} plus any required
    # input parameters. Alternatively, path can be used for an Amazon Web Services service path-based
    # API. The ensuing service_api refers to the path to an Amazon Web Services service resource,
    # including the region of the integrated Amazon Web Services service, if applicable. For example,
    # for integration with the S3 API of `GetObject`, the `uri` can be either
    # `arn:aws:apigateway:us-west-2:s3:action/GetObject&Bucket={bucket}&Key={key}` or
    # `arn:aws:apigateway:us-west-2:s3:path/{bucket}/{key}`.
    @[JSON::Field(key: "uri")]
    property uri : String | Nil

    # The type of the network connection to the integration endpoint. The valid value is `INTERNET`
    # for connections through the public routable internet or `VPC_LINK` for private connections
    # between API Gateway and a network load balancer in a VPC. The default value is `INTERNET`.
    @[JSON::Field(key: "connectionType", converter: AAG::ConnectionType)]
    property connection_type : ConnectionType | Nil

    # The ID of the VpcLink used for the integration. Specify this value only if you specify
    # `VPC_LINK` as the connection type.
    @[JSON::Field(key: "connectionId")]
    property connection_id : String | Nil

    # Specifies whether credentials are required for a put integration.
    @[JSON::Field(key: "credentials")]
    property credentials : String | Nil

    # A key-value map specifying request parameters that are passed from the method request to the
    # back end. The key is an integration request parameter name and the associated value is a method
    # request parameter value or static value that must be enclosed within single quotes and
    # pre-encoded as required by the back end. The method request parameter value must match the
    # pattern of `method.request.{location}.{name}`, where `location` is `querystring`, `path`, or
    # `header` and `name` must be a valid and unique method request parameter name.
    @[JSON::Field(key: "requestParameters")]
    property request_parameters : Hash(String, String) | Nil

    # Represents a map of Velocity templates that are applied on the request payload based on the
    # value of the Content-Type header sent by the client. The content type value is the key in this
    # map, and the template (as a String) is the value.
    @[JSON::Field(key: "requestTemplates")]
    property request_templates : Hash(String, String) | Nil

    # Specifies the pass-through behavior for incoming requests based on the Content-Type header in
    # the request, and the available mapping templates specified as the `requestTemplates` property on
    # the Integration resource. There are three valid values: `WHEN_NO_MATCH`, `WHEN_NO_TEMPLATES`,
    # and `NEVER`.
    @[JSON::Field(key: "passthroughBehavior")]
    property passthrough_behavior : String | Nil

    # Specifies a group of related cached parameters. By default, API Gateway uses the resource ID as
    # the `cacheNamespace`. You can specify the same `cacheNamespace` across resources to return the
    # same cached data for requests to different resources.
    @[JSON::Field(key: "cacheNamespace")]
    property cache_namespace : String | Nil

    # A list of request parameters whose values API Gateway caches. To be valid values for
    # `cacheKeyParameters`, these parameters must also be specified for Method `requestParameters`.
    @[JSON::Field(key: "cacheKeyParameters")]
    property cache_key_parameters : Array(String) | Nil

    # Specifies how to handle request payload content type conversions. Supported values are
    # `CONVERT_TO_BINARY` and `CONVERT_TO_TEXT`, with the following behaviors:
    #
    # If this property is not defined, the request payload will be passed through from the method
    # request to integration request without modification, provided that the `passthroughBehavior` is
    # configured to support payload pass-through.
    @[JSON::Field(key: "contentHandling", converter: AAG::ContentHandlingStrategy)]
    property content_handling : ContentHandlingStrategy | Nil

    # Custom timeout between 50 and 29,000 milliseconds. The default value is 29,000 milliseconds or
    # 29 seconds. You can increase the default value to longer than 29 seconds for Regional or private
    # APIs only.
    @[JSON::Field(key: "timeoutInMillis")]
    property timeout_in_millis : Int32 | Nil

    @[JSON::Field(key: "tlsConfig")]
    property tls_config : TlsConfig | Nil

    # The response transfer mode of the integration.
    @[JSON::Field(key: "responseTransferMode", converter: AAG::ResponseTransferMode)]
    property response_transfer_mode : ResponseTransferMode | Nil

    # The ALB or NLB listener to send the request to.
    @[JSON::Field(key: "integrationTarget")]
    property integration_target : String | Nil

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
      @http_method : String,
      @type : IntegrationType,
      @integration_http_method : String | Nil = nil,
      @uri : String | Nil = nil,
      @connection_type : ConnectionType | Nil = nil,
      @connection_id : String | Nil = nil,
      @credentials : String | Nil = nil,
      @request_parameters : Hash(String, String) | Nil = nil,
      @request_templates : Hash(String, String) | Nil = nil,
      @passthrough_behavior : String | Nil = nil,
      @cache_namespace : String | Nil = nil,
      @cache_key_parameters : Array(String) | Nil = nil,
      @content_handling : ContentHandlingStrategy | Nil = nil,
      @timeout_in_millis : Int32 | Nil = nil,
      @tls_config : TlsConfig | Nil = nil,
      @response_transfer_mode : ResponseTransferMode | Nil = nil,
      @integration_target : String | Nil = nil,
    )
    end
  end
end
