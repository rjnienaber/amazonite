private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class UpdateDocumentResult
    include JSON::Serializable

    # A description of the document that was updated.
    @[JSON::Field(key: "DocumentDescription")]
    property document_description : DocumentDescription | Nil

    def initialize(
      @document_description : DocumentDescription | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @document_description
        value.validate!
      end
    end

    def_equals_and_hash(@document_description)
  end
end
