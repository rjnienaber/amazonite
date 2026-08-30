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

    def_equals_and_hash(@document)
  end
end
