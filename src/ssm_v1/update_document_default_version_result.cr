module Amazonite::SsmV1
  class UpdateDocumentDefaultVersionResult
    include JSON::Serializable

    # The description of a custom document that you want to set as the default version.
    @[JSON::Field(key: "Description")]
    property description : DocumentDefaultVersionDescription | Nil

    def initialize(
      @description : DocumentDefaultVersionDescription | Nil = nil,
    )
    end

    def_equals_and_hash(@description)
  end
end
