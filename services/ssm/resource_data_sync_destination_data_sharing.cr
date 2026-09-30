private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Synchronize Amazon Web Services Systems Manager Inventory data from multiple Amazon Web Services
  # accounts defined in Organizations to a centralized Amazon S3 bucket. Data is synchronized to
  # individual key prefixes in the central bucket. Each key prefix represents a different Amazon Web
  # Services account ID.
  class ResourceDataSyncDestinationDataSharing
    include JSON::Serializable

    # The sharing data type. Only `Organization` is supported.
    @[JSON::Field(key: "DestinationDataSharingType")]
    property destination_data_sharing_type : String | Nil

    def initialize(
      @destination_data_sharing_type : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @destination_data_sharing_type
        raise Core::ValidationError.new("DestinationDataSharingType length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DestinationDataSharingType length must be <= 64") if value.size > 64
      end
    end

    def_equals_and_hash(@destination_data_sharing_type)
  end
end
