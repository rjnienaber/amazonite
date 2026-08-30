module Amazonite::LambdaV1
  class ListFunctionVersionsByCapacityProviderRequest
    include JSON::Serializable

    # The name of the capacity provider to list function versions for.
    @[JSON::Field(key: "CapacityProviderName", ignore: true)]
    property capacity_provider_name : String = ""

    # Specify the pagination token that's returned by a previous request to retrieve the next page of
    # results.
    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    # The maximum number of function versions to return in the response.
    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @capacity_provider_name : String,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@capacity_provider_name, @marker, @max_items)
  end
end
