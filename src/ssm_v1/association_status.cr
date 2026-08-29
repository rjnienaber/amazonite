private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes an association status.
  class AssociationStatus
    include JSON::Serializable

    # The date when the status changed.
    @[JSON::Field(key: "Date", converter: Core::AWSEpochConverter)]
    property date : Time

    # The status.
    @[JSON::Field(key: "Name", converter: AS::AssociationStatusName)]
    property name : AssociationStatusName

    # The reason for the status.
    @[JSON::Field(key: "Message")]
    property message : String

    # A user-defined string.
    @[JSON::Field(key: "AdditionalInfo")]
    property additional_info : String | Nil

    def initialize(
      @date : Time,
      @name : AssociationStatusName,
      @message : String,
      @additional_info : String | Nil = nil,
    )
    end
  end
end
