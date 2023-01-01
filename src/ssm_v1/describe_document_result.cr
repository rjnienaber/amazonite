module Amazonite::SsmV1
  class DescribeDocumentResult
    include JSON::Serializable

    @[JSON::Field(key: "Document")]
    property document : DocumentDescription | Nil

    def initialize(
      @document : DocumentDescription | Nil = nil
    )
    end
  end
end
