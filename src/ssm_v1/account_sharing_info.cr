module Amazonite::SsmV1
  class AccountSharingInfo
    include JSON::Serializable

    @[JSON::Field(key: "AccountId")]
    property account_id : String | Nil

    @[JSON::Field(key: "SharedDocumentVersion")]
    property shared_document_version : String | Nil

    def initialize(
      @account_id : String | Nil = nil,
      @shared_document_version : String | Nil = nil
    )
    end
  end
end
