module Amazonite::ApiGatewayV1
  # Requests API Gateway to create a new BasePathMapping resource.
  class CreateBasePathMappingRequest
    include JSON::Serializable

    # The domain name of the BasePathMapping resource to create.
    @[JSON::Field(key: "domainName", ignore: true)]
    property domain_name : String = ""

    # The identifier for the domain name resource. Required for private custom domain names.
    @[JSON::Field(key: "domainNameId", ignore: true)]
    property domain_name_id : String | Nil

    # The base path name that callers of the API must provide as part of the URL after the domain
    # name. This value must be unique for all of the mappings across a single API. Specify '(none)' if
    # you do not want callers to specify a base path name after the domain name.
    @[JSON::Field(key: "basePath")]
    property base_path : String | Nil

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId")]
    property rest_api_id : String

    # The name of the API's stage that you want to use for this mapping. Specify '(none)' if you want
    # callers to explicitly specify the stage name after any base path name.
    @[JSON::Field(key: "stage")]
    property stage : String | Nil

    def initialize(
      @domain_name : String,
      @rest_api_id : String,
      @domain_name_id : String | Nil = nil,
      @base_path : String | Nil = nil,
      @stage : String | Nil = nil,
    )
    end

    def_equals_and_hash(@domain_name, @domain_name_id, @base_path, @rest_api_id, @stage)
  end
end
