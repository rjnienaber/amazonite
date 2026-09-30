module Amazonite::ApiGateway
  # Represents a usage plan key to identify a plan customer.
  class UsagePlanKey
    include JSON::Serializable

    # The Id of a usage plan key.
    @[JSON::Field(key: "id")]
    property id : String | Nil

    # The type of a usage plan key. Currently, the valid key type is `API_KEY`.
    @[JSON::Field(key: "type")]
    property type : String | Nil

    # The value of a usage plan key.
    @[JSON::Field(key: "value")]
    property value : String | Nil

    # The name of a usage plan key.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    def initialize(
      @id : String | Nil = nil,
      @type : String | Nil = nil,
      @value : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @type, @value, @name)
  end
end
