private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # Represents a collection of ClientCertificate resources.
  class ClientCertificates
    include JSON::Serializable

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property items : Array(ClientCertificate) | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @items : Array(ClientCertificate) | Nil = nil,
      @position : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @items
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@items, @position)
  end
end
