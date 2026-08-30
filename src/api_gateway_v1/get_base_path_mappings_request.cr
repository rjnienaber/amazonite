module Amazonite::ApiGatewayV1
  # A request to get information about a collection of BasePathMapping resources.
  class GetBasePathMappingsRequest
    include JSON::Serializable

    # The domain name of a BasePathMapping resource.
    @[JSON::Field(key: "domainName", ignore: true)]
    property domain_name : String = ""

    # The identifier for the domain name resource. Supported only for private custom domain names.
    @[JSON::Field(key: "domainNameId", ignore: true)]
    property domain_name_id : String | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    # The maximum number of returned results per page. The default value is 25 and the maximum value
    # is 500.
    @[JSON::Field(key: "limit", ignore: true)]
    property limit : Int32 | Nil

    def initialize(
      @domain_name : String,
      @domain_name_id : String | Nil = nil,
      @position : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@domain_name, @domain_name_id, @position, @limit)
  end
end
