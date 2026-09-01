private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  # Represents a domain name access association between an access association source and a private
  # custom domain name. With a domain name access association, an access association source can
  # invoke a private custom domain name while isolated from the public internet.
  class DomainNameAccessAssociation
    include JSON::Serializable

    # The ARN of the domain name access association resource.
    @[JSON::Field(key: "domainNameAccessAssociationArn")]
    property domain_name_access_association_arn : String | Nil

    # The ARN of the domain name.
    @[JSON::Field(key: "domainNameArn")]
    property domain_name_arn : String | Nil

    # The type of the domain name access association source.
    @[JSON::Field(key: "accessAssociationSourceType", converter: AAG::AccessAssociationSourceType)]
    property access_association_source_type : AccessAssociationSourceType | Nil

    # The ARN of the domain name access association source. For a VPCE, the ARN must be a VPC
    # endpoint.
    @[JSON::Field(key: "accessAssociationSource")]
    property access_association_source : String | Nil

    # The collection of tags. Each tag element is associated with a given resource.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @domain_name_access_association_arn : String | Nil = nil,
      @domain_name_arn : String | Nil = nil,
      @access_association_source_type : AccessAssociationSourceType | Nil = nil,
      @access_association_source : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@domain_name_access_association_arn, @domain_name_arn, @access_association_source_type, @access_association_source, @tags)
  end
end
