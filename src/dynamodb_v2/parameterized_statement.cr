module Amazonite::DynamoDBv2
  class ParameterizedStatement
    include JSON::Serializable

    @[JSON::Field(key: "Statement")]
    property statement : String

    @[JSON::Field(key: "Parameters")]
    property parameters : Array(AttributeValue) | Nil

    def initialize(
      @statement : String,
      @parameters : Array(AttributeValue) | Nil = nil
    )
    end
  end
end