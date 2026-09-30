private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # A request to change information about the DomainName resource.
  class UpdateDomainNameRequest
    include JSON::Serializable

    # The name of the DomainName resource to be changed.
    @[JSON::Field(key: "domainName", ignore: true)]
    property domain_name : String = ""

    # The identifier for the domain name resource. Supported only for private custom domain names.
    @[JSON::Field(key: "domainNameId", ignore: true)]
    property domain_name_id : String | Nil

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @domain_name : String,
      @domain_name_id : String | Nil = nil,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @patch_operations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@domain_name, @domain_name_id, @patch_operations)
  end
end
