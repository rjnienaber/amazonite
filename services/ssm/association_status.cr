private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @message
        raise Core::ValidationError.new("Message length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Message length must be <= 1024") if value.size > 1024
      end

      if value = @additional_info
        raise Core::ValidationError.new("AdditionalInfo length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("AdditionalInfo length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@date, @name, @message, @additional_info)
  end
end
