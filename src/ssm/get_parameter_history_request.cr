private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 2048") if value.size > 2048
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@name, @with_decryption, @max_results, @next_token)
  end
end
