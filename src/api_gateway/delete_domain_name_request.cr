module Amazonite::ApiGateway
  # A request to delete the DomainName resource.
  class DeleteDomainNameRequest
    include JSON::Serializable

    # The name of the DomainName resource to be deleted.
    @[JSON::Field(key: "domainName", ignore: true)]
    property domain_name : String = ""

    # The identifier for the domain name resource. Supported only for private custom domain names.
    @[JSON::Field(key: "domainNameId", ignore: true)]
    property domain_name_id : String | Nil

    def initialize(
      @domain_name : String,
      @domain_name_id : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@domain_name, @domain_name_id)
  end
end
