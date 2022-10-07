module Amazonite
  module DynamoDB
    class AttributeValueUpdate
      include JSON::Serializable

      @[JSON::Field(key: "Value")]
      property value : AttributeValue | Nil

      @[JSON::Field(key: "Action", converter: Amazonite::DynamoDB::AttributeAction)]
      property action : AttributeAction | Nil

      def initialize(
        @value : AttributeValue | Nil = nil,
        @action : AttributeAction | Nil = nil
      )
      end
    end
  end
end
