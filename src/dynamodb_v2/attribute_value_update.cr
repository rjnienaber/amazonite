private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class AttributeValueUpdate
    include JSON::Serializable

    @[JSON::Field(key: "Value")]
    property value : AttributeValue | Nil

    @[JSON::Field(key: "Action", converter: ADDB::AttributeAction)]
    property action : AttributeAction | Nil

    def initialize(
      @value : AttributeValue | Nil = nil,
      @action : AttributeAction | Nil = nil
    )
    end
  end
end