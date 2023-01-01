module Amazonite::SsmV1
  class AttachmentInformation
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @name : String | Nil = nil
    )
    end
  end
end
