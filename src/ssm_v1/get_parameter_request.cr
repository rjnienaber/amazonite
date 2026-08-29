module Amazonite::SsmV1
  class GetParameterRequest
    include JSON::Serializable

    # The name or Amazon Resource Name (ARN) of the parameter that you want to query. For parameters
    # shared with you from another account, you must use the full ARN.
    #
    # To query by parameter label, use `"Name": "name:label"`. To query by parameter version, use
    # `"Name": "name:version"`.
    #
    # For more information about shared parameters, see [Working with shared
    # parameters](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "Name")]
    property name : String

    # Return decrypted values for secure string parameters. This flag is ignored for `String` and
    # `StringList` parameter types.
    @[JSON::Field(key: "WithDecryption")]
    property with_decryption : Bool | Nil

    def initialize(
      @name : String,
      @with_decryption : Bool | Nil = nil,
    )
    end
  end
end
