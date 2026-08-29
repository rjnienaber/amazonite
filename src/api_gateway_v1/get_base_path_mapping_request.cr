module Amazonite::ApiGatewayV1
  # Request to describe a BasePathMapping resource.
  class GetBasePathMappingRequest
    include JSON::Serializable

    # The domain name of the BasePathMapping resource to be described.
    @[JSON::Field(key: "domainName", ignore: true)]
    property domain_name : String = ""

    # The identifier for the domain name resource. Supported only for private custom domain names.
    @[JSON::Field(key: "domainNameId", ignore: true)]
    property domain_name_id : String | Nil

    # The base path name that callers of the API must provide as part of the URL after the domain
    # name. This value must be unique for all of the mappings across a single API. Specify '(none)' if
    # you do not want callers to specify any base path name after the domain name.
    @[JSON::Field(key: "basePath", ignore: true)]
    property base_path : String = ""

    def initialize(
      @domain_name : String,
      @base_path : String,
      @domain_name_id : String | Nil = nil,
    )
    end
  end
end
