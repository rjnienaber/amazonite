module Amazonite::LambdaV1
  class ListFunctionVersionsByCapacityProviderResponse
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the capacity provider.
    @[JSON::Field(key: "CapacityProviderArn")]
    property capacity_provider_arn : String

    # A list of function versions that use the specified capacity provider.
    @[JSON::Field(key: "FunctionVersions")]
    property function_versions : Array(FunctionVersionsByCapacityProviderListItem) = [] of FunctionVersionsByCapacityProviderListItem

    # The pagination token that's included if more results are available.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @capacity_provider_arn : String,
      @function_versions : Array(FunctionVersionsByCapacityProviderListItem),
      @next_marker : String | Nil = nil,
    )
    end

    def_equals_and_hash(@capacity_provider_arn, @function_versions, @next_marker)
  end
end
