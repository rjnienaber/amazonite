module Amazonite::SsmV1
  # Information includes the Amazon Web Services account ID where the current document is shared and
  # the version shared with that account.
  class AccountSharingInfo
    include JSON::Serializable

    # The Amazon Web Services account ID where the current document is shared.
    @[JSON::Field(key: "AccountId")]
    property account_id : String | Nil

    # The version of the current document shared with the account.
    @[JSON::Field(key: "SharedDocumentVersion")]
    property shared_document_version : String | Nil

    def initialize(
      @account_id : String | Nil = nil,
      @shared_document_version : String | Nil = nil,
    )
    end
  end
end
