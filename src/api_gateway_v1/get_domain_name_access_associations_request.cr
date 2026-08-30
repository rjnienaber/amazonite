private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  class GetDomainNameAccessAssociationsRequest
    include JSON::Serializable

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    # The maximum number of returned results per page. The default value is 25 and the maximum value
    # is 500.
    @[JSON::Field(key: "limit", ignore: true)]
    property limit : Int32 | Nil

    # The owner of the domain name access association. Use `SELF` to only list the domain name access
    # associations owned by your own account. Use `OTHER_ACCOUNTS` to list the domain name access
    # associations with your private custom domain names that are owned by other AWS accounts.
    @[JSON::Field(key: "resourceOwner", converter: AAG::ResourceOwner, ignore: true)]
    property resource_owner : ResourceOwner | Nil

    def initialize(
      @position : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @resource_owner : ResourceOwner | Nil = nil,
    )
    end

    def_equals_and_hash(@position, @limit, @resource_owner)
  end
end
