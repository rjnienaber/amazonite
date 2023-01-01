private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class AssociationStatus
    include JSON::Serializable

    @[JSON::Field(key: "Date", converter: Core::AWSEpochConverter)]
    property date : Time

    @[JSON::Field(key: "Name", converter: AS::AssociationStatusName)]
    property name : AssociationStatusName

    @[JSON::Field(key: "Message")]
    property message : String

    @[JSON::Field(key: "AdditionalInfo")]
    property additional_info : String | Nil

    def initialize(
      @date : Time,
      @name : AssociationStatusName,
      @message : String,
      @additional_info : String | Nil = nil
    )
    end
  end
end
