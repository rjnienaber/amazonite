module Amazonite::SsmV1
  # A notification about the OpsItem.
  class OpsItemNotification
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of an Amazon Simple Notification Service (Amazon SNS) topic where
    # notifications are sent when this OpsItem is edited or changed.
    @[JSON::Field(key: "Arn")]
    property arn : String | Nil

    def initialize(
      @arn : String | Nil = nil,
    )
    end
  end
end
