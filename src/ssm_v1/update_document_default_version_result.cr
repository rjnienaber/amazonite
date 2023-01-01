module Amazonite::SsmV1
  class UpdateDocumentDefaultVersionResult
    include JSON::Serializable

    @[JSON::Field(key: "Description")]
    property description : DocumentDefaultVersionDescription | Nil

    def initialize(
      @description : DocumentDefaultVersionDescription | Nil = nil
    )
    end
  end
end
