private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DeleteInventoryRequest
    include JSON::Serializable

    # The name of the custom inventory type for which you want to delete either all previously
    # collected data or the inventory type itself.
    @[JSON::Field(key: "TypeName")]
    property type_name : String

    # Use the `SchemaDeleteOption` to delete a custom inventory type (schema). If you don't choose
    # this option, the system only deletes existing inventory data associated with the custom
    # inventory type. Choose one of the following options:
    #
    # DisableSchema: If you choose this option, the system ignores all inventory data for the
    # specified version, and any earlier versions. To enable this schema again, you must call the
    # `PutInventory` operation for a version greater than the disabled version.
    #
    # DeleteSchema: This option deletes the specified custom type from the Inventory service. You can
    # recreate the schema later, if you want.
    @[JSON::Field(key: "SchemaDeleteOption", converter: AS::InventorySchemaDeleteOption)]
    property schema_delete_option : InventorySchemaDeleteOption | Nil

    # Use this option to view a summary of the deletion request without deleting any data or the data
    # type. This option is useful when you only want to understand what will be deleted. Once you
    # validate that the data to be deleted is what you intend to delete, you can run the same command
    # without specifying the `DryRun` option.
    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    # User-provided idempotency token.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    def initialize(
      @type_name : String,
      @schema_delete_option : InventorySchemaDeleteOption | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @type_name
        raise Core::ValidationError.new("TypeName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TypeName length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("TypeName does not match the required pattern") unless value.matches?(Regex.new("^(AWS|Custom):.*$"))
      end

      if value = @client_token
        raise Core::ValidationError.new("ClientToken does not match the required pattern") unless value.matches?(Regex.new("^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$"))
      end
    end

    def_equals_and_hash(@type_name, @schema_delete_option, @dry_run, @client_token)
  end
end
