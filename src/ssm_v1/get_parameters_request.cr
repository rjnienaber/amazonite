module Amazonite::SsmV1
  class GetParametersRequest
    include JSON::Serializable

    # The names or Amazon Resource Names (ARNs) of the parameters that you want to query. For
    # parameters shared with you from another account, you must use the full ARNs.
    #
    # To query by parameter label, use `"Name": "name:label"`. To query by parameter version, use
    # `"Name": "name:version"`.
    #
    # The results for `GetParameters` requests are listed in alphabetical order in query responses.
    #
    # For information about shared parameters, see [Working with shared
    # parameters](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "Names")]
    property names : Array(String) = [] of String

    # Return decrypted secure string value. Return decrypted values for secure string parameters. This
    # flag is ignored for `String` and `StringList` parameter types.
    @[JSON::Field(key: "WithDecryption")]
    property with_decryption : Bool | Nil

    def initialize(
      @names : Array(String),
      @with_decryption : Bool | Nil = nil,
    )
    end
  end
end
