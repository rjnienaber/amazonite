module Amazonite::SsmV1
  class DescribeDocumentPermissionResponse
    include JSON::Serializable

    @[JSON::Field(key: "AccountIds")]
    property account_ids : Array(String) | Nil

    @[JSON::Field(key: "AccountSharingInfoList")]
    property account_sharing_info_list : Array(AccountSharingInfo) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @account_ids : Array(String) | Nil = nil,
      @account_sharing_info_list : Array(AccountSharingInfo) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
