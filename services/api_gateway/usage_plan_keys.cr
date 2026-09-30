private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # Represents the collection of usage plan keys added to usage plans for the associated API keys
  # and, possibly, other types of keys.
  class UsagePlanKeys
    include JSON::Serializable

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property items : Array(UsagePlanKey) | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @items : Array(UsagePlanKey) | Nil = nil,
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
