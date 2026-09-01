private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # Updates an existing VpcLink of a specified identifier.
  class UpdateVpcLinkRequest
    include JSON::Serializable

    # The identifier of the VpcLink. It is used in an Integration to reference this VpcLink.
    @[JSON::Field(key: "vpcLinkId", ignore: true)]
    property vpc_link_id : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @vpc_link_id : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @patch_operations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpc_link_id, @patch_operations)
  end
end
