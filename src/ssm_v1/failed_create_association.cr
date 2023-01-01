private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class FailedCreateAssociation
    include JSON::Serializable

    @[JSON::Field(key: "Entry")]
    property entry : CreateAssociationBatchRequestEntry | Nil

    @[JSON::Field(key: "Message")]
    property message : String | Nil

    @[JSON::Field(key: "Fault", converter: AS::Fault)]
    property fault : Fault | Nil

    def initialize(
      @entry : CreateAssociationBatchRequestEntry | Nil = nil,
      @message : String | Nil = nil,
      @fault : Fault | Nil = nil
    )
    end
  end
end
