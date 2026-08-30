private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeDocumentResult
    include JSON::Serializable

    # Information about the SSM document.
    @[JSON::Field(key: "Document")]
    property document : DocumentDescription | Nil

    def initialize(
      @document : DocumentDescription | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @document
        value.validate!
      end
    end

    def_equals_and_hash(@document)
  end
end
