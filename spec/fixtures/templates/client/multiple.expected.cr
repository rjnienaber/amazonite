private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class Client < Core::Client
    Log = ::Log.for("amazonite.dynamodb_v2.client")

    def initialize(config = Core::Config.new)
      super("DynamoDB_20120810", "dynamodb", "1.0", nil, config)
    end

    # Creates a new item, or replaces an old item with a new item. If an item that has the same
    # primary key as the new item already exists in the specified table, the new item completely
    # replaces the existing item. You can perform a conditional put operation (add a new item if one
    # with the specified primary key doesn't exist), or replace an existing item if it has certain
    # attribute values. You can return the item's attribute values in the same operation, using the
    # `ReturnValues` parameter.
    #
    # When you add an item, the primary key attributes are the only required attributes.
    #
    # Empty String and Binary attribute values are allowed. Attribute values of type String and Binary
    # must have a length greater than zero if the attribute is used as a key attribute for a table or
    # index. Set type attributes cannot be empty.
    #
    # Invalid Requests with empty values will be rejected with a `ValidationException` exception.
    #
    # To prevent a new item from replacing an existing item, use a conditional expression that
    # contains the `attribute_not_exists` function with the name of the attribute being used as the
    # partition key for the table. Since every record must contain that attribute, the
    # `attribute_not_exists` function will only succeed if no matching item exists.
    #
    # To determine whether `PutItem` overwrote an existing item, use `ReturnValues` set to `ALL_OLD`.
    # If the response includes the `Attributes` element, an existing item was overwritten.
    #
    # For more information about `PutItem`, see [Working with
    # Items](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithItems.html)
    # in the *Amazon DynamoDB Developer Guide*.
    def put_item(input : ADDB::PutItemInput) : Core::ParsedResponse(ADDB::PutItemOutput)
      Log.info { "performing 'PutItem' operation" }
      input.validate! if config.validate_input?
      response = post("PutItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::PutItemOutput).new(response)
    end

    # The `GetItem` operation returns a set of attributes for the item with the given primary key. If
    # there is no matching item, `GetItem` does not return any data and there will be no `Item`
    # element in the response.
    #
    # `GetItem` provides an eventually consistent read by default. If your application requires a
    # strongly consistent read, set `ConsistentRead` to `true`. Although a strongly consistent read
    # might take more time than an eventually consistent read, it always returns the last updated
    # value.
    def get_item(input : ADDB::GetItemInput) : Core::ParsedResponse(ADDB::GetItemOutput)
      Log.info { "performing 'GetItem' operation" }
      input.validate! if config.validate_input?
      response = post("GetItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::GetItemOutput).new(response)
    end

    # Edits an existing item's attributes, or adds a new item to the table if it does not already
    # exist. You can put, delete, or add attribute values. You can also perform a conditional update
    # on an existing item (insert a new attribute name-value pair if it doesn't exist, or replace an
    # existing name-value pair if it has certain expected attribute values).
    #
    # You can also return the item's attribute values in the same `UpdateItem` operation using the
    # `ReturnValues` parameter.
    def update_item(input : ADDB::UpdateItemInput) : Core::ParsedResponse(ADDB::UpdateItemOutput)
      Log.info { "performing 'UpdateItem' operation" }
      input.validate! if config.validate_input?
      response = post("UpdateItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::UpdateItemOutput).new(response)
    end

    # Deletes a single item in a table by primary key. You can perform a conditional delete operation
    # that deletes the item if it exists, or if it has an expected attribute value.
    #
    # In addition to deleting an item, you can also return the item's attribute values in the same
    # operation, using the `ReturnValues` parameter.
    #
    # Unless you specify conditions, the `DeleteItem` is an idempotent operation; running it multiple
    # times on the same item or attribute does *not* result in an error response.
    #
    # Conditional deletes are useful for deleting items only if specific conditions are met. If those
    # conditions are met, DynamoDB performs the delete. Otherwise, the item is not deleted.
    def delete_item(input : ADDB::DeleteItemInput) : Core::ParsedResponse(ADDB::DeleteItemOutput)
      Log.info { "performing 'DeleteItem' operation" }
      input.validate! if config.validate_input?
      response = post("DeleteItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::DeleteItemOutput).new(response)
    end
  end
end
