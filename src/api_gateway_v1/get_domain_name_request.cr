module Amazonite::ApiGatewayV1
  # Request to get the name of a DomainName resource.
  class GetDomainNameRequest
    include JSON::Serializable

    # The name of the DomainName resource.
    @[JSON::Field(key: "domainName", ignore: true)]
    property domain_name : String = ""

    # The identifier for the domain name resource. Required for private custom domain names.
    @[JSON::Field(key: "domainNameId", ignore: true)]
    property domain_name_id : String | Nil

    def initialize(
      @domain_name : String,
      @domain_name_id : String | Nil = nil,
    )
    end
  end
end
