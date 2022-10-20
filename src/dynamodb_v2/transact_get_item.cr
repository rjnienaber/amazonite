module Amazonite::DynamoDBv2
  class TransactGetItem
    include JSON::Serializable

    @[JSON::Field(key: "Get")]
    property get : Get

    def initialize(
      @get : Get
    )
    end
  end
end