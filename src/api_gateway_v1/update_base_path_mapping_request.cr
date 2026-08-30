module Amazonite::ApiGatewayV1
  # A request to change information about the BasePathMapping resource.
  class UpdateBasePathMappingRequest
    include JSON::Serializable

    # The domain name of the BasePathMapping resource to change.
    @[JSON::Field(key: "domainName", ignore: true)]
    property domain_name : String = ""

    # The identifier for the domain name resource. Supported only for private custom domain names.
    @[JSON::Field(key: "domainNameId", ignore: true)]
    property domain_name_id : String | Nil

    # The base path of the BasePathMapping resource to change.
    #
    # To specify an empty base path, set this parameter to `'(none)'`.
    @[JSON::Field(key: "basePath", ignore: true)]
    property base_path : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @domain_name : String,
      @base_path : String,
      @domain_name_id : String | Nil = nil,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end
  end
end
