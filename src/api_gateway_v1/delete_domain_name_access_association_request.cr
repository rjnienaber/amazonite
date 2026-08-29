module Amazonite::ApiGatewayV1
  class DeleteDomainNameAccessAssociationRequest
    include JSON::Serializable

    # The ARN of the domain name access association resource.
    @[JSON::Field(key: "domainNameAccessAssociationArn", ignore: true)]
    property domain_name_access_association_arn : String = ""

    def initialize(
      @domain_name_access_association_arn : String,
    )
    end
  end
end
