module Amazonite::LambdaV1
  class ListFunctionVersionsByCapacityProviderResponse
    include JSON::Serializable

    @[JSON::Field(key: "CapacityProviderArn")]
    property capacity_provider_arn : String

    @[JSON::Field(key: "FunctionVersions")]
    property function_versions : Array(FunctionVersionsByCapacityProviderListItem) = [] of FunctionVersionsByCapacityProviderListItem

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @capacity_provider_arn : String,
      @function_versions : Array(FunctionVersionsByCapacityProviderListItem),
      @next_marker : String | Nil = nil,
    )
    end
  end
end
