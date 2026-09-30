private alias Core = Amazonite::Core

module Amazonite::Ssm
  class ListOpsMetadataResult
    include JSON::Serializable

    # Returns a list of OpsMetadata objects.
    @[JSON::Field(key: "OpsMetadataList")]
    property ops_metadata_list : Array(OpsMetadata) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @ops_metadata_list : Array(OpsMetadata) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @ops_metadata_list
        raise Core::ValidationError.new("OpsMetadataList must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("OpsMetadataList must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ops_metadata_list, @next_token)
  end
end
