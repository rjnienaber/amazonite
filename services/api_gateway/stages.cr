private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # A list of Stage resources that are associated with the ApiKey resource.
  class Stages
    include JSON::Serializable

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property item : Array(Stage) | Nil

    def initialize(
      @item : Array(Stage) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @item
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@item)
  end
end
