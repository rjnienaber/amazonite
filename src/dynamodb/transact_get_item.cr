private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Specifies an item to be retrieved as part of the transaction.
  class TransactGetItem
    include JSON::Serializable

    # Contains the primary key that identifies the item to get, together with the name of the table
    # that contains the item, and optionally the specific attributes of the item to retrieve.
    @[JSON::Field(key: "Get")]
    property get : Get

    def initialize(
      @get : Get,
    )
    end

    def validate! : Nil
      if value = @get
        value.validate!
      end
    end

    def_equals_and_hash(@get)
  end
end
