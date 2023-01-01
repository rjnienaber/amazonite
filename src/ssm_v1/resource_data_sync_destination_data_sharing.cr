module Amazonite::SsmV1
  class ResourceDataSyncDestinationDataSharing
    include JSON::Serializable

    @[JSON::Field(key: "DestinationDataSharingType")]
    property destination_data_sharing_type : String | Nil

    def initialize(
      @destination_data_sharing_type : String | Nil = nil
    )
    end
  end
end
