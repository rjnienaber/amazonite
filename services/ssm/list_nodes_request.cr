private alias Core = Amazonite::Core

module Amazonite::Ssm
  class ListNodesRequest
    include JSON::Serializable

    # The name of the Amazon Web Services managed resource data sync to retrieve information about.
    #
    # For cross-account/cross-Region configurations, this parameter is required, and the name of the
    # supported resource data sync is `AWS-QuickSetup-ManagedNode`.
    #
    # For single account/single-Region configurations, the parameter is not required.
    @[JSON::Field(key: "SyncName")]
    property sync_name : String | Nil

    # One or more filters. Use a filter to return a more specific list of managed nodes.
    @[JSON::Field(key: "Filters")]
    property filters : Array(NodeFilter) | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @sync_name : String | Nil = nil,
      @filters : Array(NodeFilter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @sync_name
        raise Core::ValidationError.new("SyncName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SyncName length must be <= 64") if value.size > 64
      end

      if value = @filters
        raise Core::ValidationError.new("Filters must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Filters must have at most 5 item(s)") if value.size > 5
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@sync_name, @filters, @next_token, @max_results)
  end
end
