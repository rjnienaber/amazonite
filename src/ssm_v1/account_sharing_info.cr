private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @account_id
        raise Core::ValidationError.new("AccountId does not match the required pattern") unless value.matches?(Regex.new("^(?i)all|[0-9]{12}$"))
      end

      if value = @shared_document_version
        raise Core::ValidationError.new("SharedDocumentVersion length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("SharedDocumentVersion length must be <= 8") if value.size > 8
        raise Core::ValidationError.new("SharedDocumentVersion does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|[$]ALL)$"))
      end
    end

    def_equals_and_hash(@account_id, @shared_document_version)
  end
end
