private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class ModifyDocumentPermissionRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "PermissionType", converter: AS::DocumentPermissionType)]
    property permission_type : DocumentPermissionType

    @[JSON::Field(key: "AccountIdsToAdd")]
    property account_ids_to_add : Array(String) | Nil

    @[JSON::Field(key: "AccountIdsToRemove")]
    property account_ids_to_remove : Array(String) | Nil

    @[JSON::Field(key: "SharedDocumentVersion")]
    property shared_document_version : String | Nil

    def initialize(
      @name : String,
      @permission_type : DocumentPermissionType,
      @account_ids_to_add : Array(String) | Nil = nil,
      @account_ids_to_remove : Array(String) | Nil = nil,
      @shared_document_version : String | Nil = nil
    )
    end
  end
end
