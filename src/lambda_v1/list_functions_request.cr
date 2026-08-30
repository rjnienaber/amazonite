private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class ListFunctionsRequest
    include JSON::Serializable

    # For Lambda@Edge functions, the Amazon Web Services Region of the master function. For example,
    # `us-east-1` filters the list of functions to include only Lambda@Edge functions replicated from
    # a master function in US East (N. Virginia). If specified, you must set `FunctionVersion` to
    # `ALL`.
    @[JSON::Field(key: "MasterRegion", ignore: true)]
    property master_region : String | Nil

    # Set to `ALL` to include entries for all published versions of each function.
    @[JSON::Field(key: "FunctionVersion", converter: AL::FunctionVersion, ignore: true)]
    property function_version : FunctionVersion | Nil

    # Specify the pagination token that's returned by a previous request to retrieve the next page of
    # results.
    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    # The maximum number of functions to return in the response. Note that `ListFunctions` returns a
    # maximum of 50 items in each response, even if you set the number higher.
    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @master_region : String | Nil = nil,
      @function_version : FunctionVersion | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @master_region
        raise Core::ValidationError.new("MasterRegion length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("MasterRegion length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("MasterRegion does not match the required pattern") unless value.matches?(Regex.new("^ALL|(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}$"))
      end

      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxItems value must be <= 10000") if value > 10000
      end
    end

    def_equals_and_hash(@master_region, @function_version, @marker, @max_items)
  end
end
