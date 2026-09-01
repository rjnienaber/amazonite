private alias Core = Amazonite::Core

module Amazonite::Ssm
  class UpdateDocumentDefaultVersionResult
    include JSON::Serializable

    # The description of a custom document that you want to set as the default version.
    @[JSON::Field(key: "Description")]
    property description : DocumentDefaultVersionDescription | Nil

    def initialize(
      @description : DocumentDefaultVersionDescription | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @description
        value.validate!
      end
    end

    def_equals_and_hash(@description)
  end
end
