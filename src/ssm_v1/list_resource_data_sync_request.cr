module Amazonite::SsmV1
  class ListResourceDataSyncRequest
    include JSON::Serializable

    # View a list of resource data syncs according to the sync type. Specify `SyncToDestination` to
    # view resource data syncs that synchronize data to an Amazon S3 bucket. Specify `SyncFromSource`
    # to view resource data syncs from Organizations or from multiple Amazon Web Services Regions.
    @[JSON::Field(key: "SyncType")]
    property sync_type : String | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @sync_type : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@sync_type, @next_token, @max_results)
  end
end
