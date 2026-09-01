private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # An ordered list of errors for each item in the request which caused the transaction to get
  # cancelled. The values of the list are ordered according to the ordering of the
  # `TransactWriteItems` request parameter. If no error occurred for the associated item an error
  # with a Null code and Null message will be present.
  class CancellationReason
    include JSON::Serializable

    # Item in the request which caused the transaction to get cancelled.
    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue) | Nil

    # Status code for the result of the cancelled transaction.
    @[JSON::Field(key: "Code")]
    property code : String | Nil

    # Cancellation reason message description.
    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @item : Hash(String, AttributeValue) | Nil = nil,
      @code : String | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @item
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@item, @code, @message)
  end
end
