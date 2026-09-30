private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetParametersByPathRequest
    include JSON::Serializable

    # The hierarchy for the parameter. Hierarchies start with a forward slash (/). The hierarchy is
    # the parameter name except the last part of the parameter. For the API call to succeed, the last
    # part of the parameter name can't be in the path. A parameter name hierarchy can have a maximum
    # of 15 levels. Here is an example of a hierarchy: `/Finance/Prod/IAD/WinServ2016/license33 `
    @[JSON::Field(key: "Path")]
    property path : String

    # Retrieve all parameters within a hierarchy.
    #
    # If a user has access to a path, then the user can access all levels of that path. For example,
    # if a user has permission to access path `/a`, then the user can also access `/a/b`. Even if a
    # user has explicitly been denied access in IAM for parameter `/a/b`, they can still call the
    # GetParametersByPath API operation recursively for `/a` and view `/a/b`.
    @[JSON::Field(key: "Recursive")]
    property recursive : Bool | Nil

    # Filters to limit the request results.
    #
    # The following `Key` values are supported for `GetParametersByPath`: `Type`, `KeyId`, and
    # `Label`.
    #
    # The following `Key` values aren't supported for `GetParametersByPath`: `tag`, `DataType`,
    # `Name`, `Path`, and `Tier`.
    @[JSON::Field(key: "ParameterFilters")]
    property parameter_filters : Array(ParameterStringFilter) | Nil

    # Retrieve all parameters in a hierarchy with their value decrypted.
    @[JSON::Field(key: "WithDecryption")]
    property with_decryption : Bool | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @path : String,
      @recursive : Bool | Nil = nil,
      @parameter_filters : Array(ParameterStringFilter) | Nil = nil,
      @with_decryption : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @path
        raise Core::ValidationError.new("Path length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Path length must be <= 2048") if value.size > 2048
      end

      if value = @parameter_filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 10") if value > 10
      end
    end

    def_equals_and_hash(@path, @recursive, @parameter_filters, @with_decryption, @max_results, @next_token)
  end
end
