module Amazonite::DynamoDBV2
  class AttributeValue
    include JSON::Serializable

    @[JSON::Field(key: "S")]
    property s : String | Nil

    @[JSON::Field(key: "N")]
    property n : String | Nil

    @[JSON::Field(key: "B")]
    property b : String | Nil

    @[JSON::Field(key: "SS")]
    property ss : Array(String) | Nil

    @[JSON::Field(key: "NS")]
    property ns : Array(String) | Nil

    @[JSON::Field(key: "BS")]
    property bs : Array(String) | Nil

    @[JSON::Field(key: "M")]
    property m : Hash(String, AttributeValue) | Nil

    @[JSON::Field(key: "L")]
    property l : Array(AttributeValue) | Nil

    @[JSON::Field(key: "NULL")]
    property null : Bool | Nil

    @[JSON::Field(key: "BOOL")]
    property bool : Bool | Nil

    def initialize(
      @s : String | Nil = nil,
      @n : String | Nil = nil,
      @b : String | Nil = nil,
      @ss : Array(String) | Nil = nil,
      @ns : Array(String) | Nil = nil,
      @bs : Array(String) | Nil = nil,
      @m : Hash(String, AttributeValue) | Nil = nil,
      @l : Array(AttributeValue) | Nil = nil,
      @null : Bool | Nil = nil,
      @bool : Bool | Nil = nil
    )
    end
  end
end
