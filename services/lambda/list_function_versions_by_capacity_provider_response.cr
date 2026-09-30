private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @capacity_provider_arn
        raise Core::ValidationError.new("CapacityProviderArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CapacityProviderArn length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("CapacityProviderArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[a-zA-Z-]*:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:capacity-provider:[a-zA-Z0-9-_]+$"))
      end

      if value = @function_versions
        raise Core::ValidationError.new("FunctionVersions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("FunctionVersions must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_provider_arn, @function_versions, @next_marker)
  end
end
