private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeDocumentPermissionResponse
    include JSON::Serializable

    # The account IDs that have permission to use this document. The ID can be either an Amazon Web
    # Services account number or `all`.
    @[JSON::Field(key: "AccountIds")]
    property account_ids : Array(String) | Nil

    # A list of Amazon Web Services accounts where the current document is shared and the version
    # shared with each account.
    @[JSON::Field(key: "AccountSharingInfoList")]
    property account_sharing_info_list : Array(AccountSharingInfo) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @account_ids : Array(String) | Nil = nil,
      @account_sharing_info_list : Array(AccountSharingInfo) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @account_ids
        raise Core::ValidationError.new("AccountIds must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AccountIds must have at most 20 item(s)") if value.size > 20
      end

      if value = @account_sharing_info_list
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@account_ids, @account_sharing_info_list, @next_token)
  end
end
