module Amazonite::ApiGateway
  # A request to delete the BasePathMapping resource.
  class DeleteBasePathMappingRequest
    include JSON::Serializable

    # The domain name of the BasePathMapping resource to delete.
    @[JSON::Field(key: "domainName", ignore: true)]
    property domain_name : String = ""

    # The identifier for the domain name resource. Supported only for private custom domain names.
    @[JSON::Field(key: "domainNameId", ignore: true)]
    property domain_name_id : String | Nil

    # The base path name of the BasePathMapping resource to delete.
    #
    # To specify an empty base path, set this parameter to `'(none)'`.
    @[JSON::Field(key: "basePath", ignore: true)]
    property base_path : String = ""

    def initialize(
      @domain_name : String,
      @base_path : String,
      @domain_name_id : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@domain_name, @domain_name_id, @base_path)
  end
end
