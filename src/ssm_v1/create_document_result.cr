module Amazonite::SsmV1
  class CreateDocumentResult
    include JSON::Serializable

    @[JSON::Field(key: "DocumentDescription")]
    property document_description : DocumentDescription | Nil

    def initialize(
      @document_description : DocumentDescription | Nil = nil
    )
    end
  end
end
