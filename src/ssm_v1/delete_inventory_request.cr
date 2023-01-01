private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class DeleteInventoryRequest
    include JSON::Serializable

    @[JSON::Field(key: "TypeName")]
    property type_name : String

    @[JSON::Field(key: "SchemaDeleteOption", converter: AS::InventorySchemaDeleteOption)]
    property schema_delete_option : InventorySchemaDeleteOption | Nil

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    def initialize(
      @type_name : String,
      @schema_delete_option : InventorySchemaDeleteOption | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil
    )
    end
  end
end
