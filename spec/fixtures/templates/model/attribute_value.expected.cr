private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the data for an attribute.
  #
  # Each attribute value is described as a name-value pair. The name is the data type, and the value
  # is the data itself.
  #
  # For more information, see [Data
  # Types](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes)
  # in the *Amazon DynamoDB Developer Guide*.
  class AttributeValue
    include JSON::Serializable

    # An attribute of type String. For example:
    #
    # `"S": "Hello"`
    @[JSON::Field(key: "S")]
    property s : String | Nil

    # An attribute of type Number. For example:
    #
    # `"N": "123.45"`
    #
    # Numbers are sent across the network to DynamoDB as strings, to maximize compatibility across
    # languages and libraries. However, DynamoDB treats them as number type attributes for
    # mathematical operations.
    @[JSON::Field(key: "N")]
    property n : String | Nil

    # An attribute of type Binary. For example:
    #
    # `"B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"`
    @[JSON::Field(key: "B", converter: Core::Base64Converter)]
    property b : Bytes | Nil

    # An attribute of type String Set. For example:
    #
    # `"SS": ["Giraffe", "Hippo" ,"Zebra"]`
    @[JSON::Field(key: "SS")]
    property ss : Array(String) | Nil

    # An attribute of type Number Set. For example:
    #
    # `"NS": ["42.2", "-19", "7.5", "3.14"]`
    #
    # Numbers are sent across the network to DynamoDB as strings, to maximize compatibility across
    # languages and libraries. However, DynamoDB treats them as number type attributes for
    # mathematical operations.
    @[JSON::Field(key: "NS")]
    property ns : Array(String) | Nil

    # An attribute of type Binary Set. For example:
    #
    # `"BS": ["U3Vubnk=", "UmFpbnk=", "U25vd3k="]`
    @[JSON::Field(key: "BS", converter: Core::Base64ArrayConverter)]
    property bs : Array(Bytes) | Nil

    # An attribute of type Map. For example:
    #
    # `"M": {"Name": {"S": "Joe"}, "Age": {"N": "35"}}`
    @[JSON::Field(key: "M")]
    property m : Hash(String, AttributeValue) | Nil

    # An attribute of type List. For example:
    #
    # `"L": [ {"S": "Cookies"} , {"S": "Coffee"}, {"N": "3.14159"}]`
    @[JSON::Field(key: "L")]
    property l : Array(AttributeValue) | Nil

    # An attribute of type Null. For example:
    #
    # `"NULL": true`
    @[JSON::Field(key: "NULL")]
    property null : Bool | Nil

    # An attribute of type Boolean. For example:
    #
    # `"BOOL": true`
    @[JSON::Field(key: "BOOL")]
    property bool : Bool | Nil

    def initialize(
      @s : String | Nil = nil,
      @n : String | Nil = nil,
      @b : Bytes | Nil = nil,
      @ss : Array(String) | Nil = nil,
      @ns : Array(String) | Nil = nil,
      @bs : Array(Bytes) | Nil = nil,
      @m : Hash(String, AttributeValue) | Nil = nil,
      @l : Array(AttributeValue) | Nil = nil,
      @null : Bool | Nil = nil,
      @bool : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @m
        value.each_value(&.validate!)
      end

      if value = @l
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@s, @n, @b, @ss, @ns, @bs, @m, @l, @null, @bool)
  end
end
