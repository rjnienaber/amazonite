private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  # Request to describe a collection of DomainName resources.
  class GetDomainNamesRequest
    include JSON::Serializable

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    # The maximum number of returned results per page. The default value is 25 and the maximum value
    # is 500.
    @[JSON::Field(key: "limit", ignore: true)]
    property limit : Int32 | Nil

    # The owner of the domain name access association.
    @[JSON::Field(key: "resourceOwner", converter: AAG::ResourceOwner, ignore: true)]
    property resource_owner : ResourceOwner | Nil

    def initialize(
      @position : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @resource_owner : ResourceOwner | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@position, @limit, @resource_owner)
  end
end
