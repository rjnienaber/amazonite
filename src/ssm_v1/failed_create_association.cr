private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Describes a failed association.
  class FailedCreateAssociation
    include JSON::Serializable

    # The association.
    @[JSON::Field(key: "Entry")]
    property entry : CreateAssociationBatchRequestEntry | Nil

    # A description of the failure.
    @[JSON::Field(key: "Message")]
    property message : String | Nil

    # The source of the failure.
    @[JSON::Field(key: "Fault", converter: AS::Fault)]
    property fault : Fault | Nil

    def initialize(
      @entry : CreateAssociationBatchRequestEntry | Nil = nil,
      @message : String | Nil = nil,
      @fault : Fault | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @entry
        value.validate!
      end
    end

    def_equals_and_hash(@entry, @message, @fault)
  end
end
