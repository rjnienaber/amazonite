private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ModifyDocumentPermissionRequest
    include JSON::Serializable

    # The name of the document that you want to share.
    @[JSON::Field(key: "Name")]
    property name : String

    # The permission type for the document. The permission type can be *Share*.
    @[JSON::Field(key: "PermissionType", converter: AS::DocumentPermissionType)]
    property permission_type : DocumentPermissionType

    # The Amazon Web Services users that should have access to the document. The account IDs can
    # either be a group of account IDs or *All*. You must specify a value for this parameter or the
    # `AccountIdsToRemove` parameter.
    @[JSON::Field(key: "AccountIdsToAdd")]
    property account_ids_to_add : Array(String) | Nil

    # The Amazon Web Services users that should no longer have access to the document. The Amazon Web
    # Services user can either be a group of account IDs or *All*. This action has a higher priority
    # than `AccountIdsToAdd`. If you specify an ID to add and the same ID to remove, the system
    # removes access to the document. You must specify a value for this parameter or the
    # `AccountIdsToAdd` parameter.
    @[JSON::Field(key: "AccountIdsToRemove")]
    property account_ids_to_remove : Array(String) | Nil

    # (Optional) The version of the document to share. If it isn't specified, the system choose the
    # `Default` version to share.
    @[JSON::Field(key: "SharedDocumentVersion")]
    property shared_document_version : String | Nil

    def initialize(
      @name : String,
      @permission_type : DocumentPermissionType,
      @account_ids_to_add : Array(String) | Nil = nil,
      @account_ids_to_remove : Array(String) | Nil = nil,
      @shared_document_version : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end

      if value = @account_ids_to_add
        raise Core::ValidationError.new("AccountIdsToAdd must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AccountIdsToAdd must have at most 20 item(s)") if value.size > 20
      end

      if value = @account_ids_to_remove
        raise Core::ValidationError.new("AccountIdsToRemove must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AccountIdsToRemove must have at most 20 item(s)") if value.size > 20
      end

      if value = @shared_document_version
        raise Core::ValidationError.new("SharedDocumentVersion length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SharedDocumentVersion length must be <= 8") if value.size > 8
        raise Core::ValidationError.new("SharedDocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|[$]ALL)$"))
      end
    end

    def_equals_and_hash(@name, @permission_type, @account_ids_to_add, @account_ids_to_remove, @shared_document_version)
  end
end
