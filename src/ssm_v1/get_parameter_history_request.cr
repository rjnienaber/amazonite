module Amazonite::SsmV1
  class GetParameterHistoryRequest
    include JSON::Serializable

    # The name or Amazon Resource Name (ARN) of the parameter for which you want to review history.
    # For parameters shared with you from another account, you must use the full ARN.
    @[JSON::Field(key: "Name")]
    property name : String

    # Return decrypted values for secure string parameters. This flag is ignored for `String` and
    # `StringList` parameter types.
    @[JSON::Field(key: "WithDecryption")]
    property with_decryption : Bool | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @name : String,
      @with_decryption : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
