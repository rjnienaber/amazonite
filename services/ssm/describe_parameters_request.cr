private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DescribeParametersRequest
    include JSON::Serializable

    # This data type is deprecated. Instead, use `ParameterFilters`.
    @[JSON::Field(key: "Filters")]
    property filters : Array(ParametersFilter) | Nil

    # Filters to limit the request results.
    @[JSON::Field(key: "ParameterFilters")]
    property parameter_filters : Array(ParameterStringFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # Lists parameters that are shared with you.
    #
    # By default when using this option, the command returns parameters that have been shared using a
    # standard Resource Access Manager Resource Share. In order for a parameter that was shared using
    # the PutResourcePolicy command to be returned, the associated `RAM Resource Share Created From
    # Policy` must have been promoted to a standard Resource Share using the RAM
    # [PromoteResourceShareCreatedFromPolicy](https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html)
    # API operation.
    #
    # For more information about sharing parameters, see [Working with shared
    # parameters](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    @[JSON::Field(key: "Shared")]
    property shared : Bool | Nil

    def initialize(
      @filters : Array(ParametersFilter) | Nil = nil,
      @parameter_filters : Array(ParameterStringFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @shared : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @parameter_filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@filters, @parameter_filters, @max_results, @next_token, @shared)
  end
end
