private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  class CreateDomainNameAccessAssociationRequest
    include JSON::Serializable

    # The ARN of the domain name.
    @[JSON::Field(key: "domainNameArn")]
    property domain_name_arn : String

    # The type of the domain name access association source.
    @[JSON::Field(key: "accessAssociationSourceType", converter: AAG::AccessAssociationSourceType)]
    property access_association_source_type : AccessAssociationSourceType

    # The identifier of the domain name access association source. For a VPCE, the value is the VPC
    # endpoint ID.
    @[JSON::Field(key: "accessAssociationSource")]
    property access_association_source : String

    # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up
    # to 128 characters and must not start with `aws:`. The tag value can be up to 256 characters.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @domain_name_arn : String,
      @access_association_source_type : AccessAssociationSourceType,
      @access_association_source : String,
      @tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
