private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @capacity_provider_name
        raise Core::ValidationError.new("CapacityProviderName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CapacityProviderName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("CapacityProviderName does not match the required pattern") unless value.matches?(Regex.new("^(arn:aws[a-zA-Z-]*:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:capacity-provider:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+$"))
      end

      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxItems value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@capacity_provider_name, @marker, @max_items)
  end
end
