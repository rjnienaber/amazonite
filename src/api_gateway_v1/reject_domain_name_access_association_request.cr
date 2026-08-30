module Amazonite::ApiGatewayV1
  class RejectDomainNameAccessAssociationRequest
    include JSON::Serializable

    # The ARN of the domain name access association resource.
    @[JSON::Field(key: "domainNameAccessAssociationArn", ignore: true)]
    property domain_name_access_association_arn : String = ""

    # The ARN of the domain name.
    @[JSON::Field(key: "domainNameArn", ignore: true)]
    property domain_name_arn : String = ""

    def initialize(
      @domain_name_access_association_arn : String,
      @domain_name_arn : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@domain_name_access_association_arn, @domain_name_arn)
  end
end
