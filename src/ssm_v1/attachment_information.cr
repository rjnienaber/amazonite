module Amazonite::SsmV1
  # An attribute of an attachment, such as the attachment name.
  class AttachmentInformation
    include JSON::Serializable

    # The name of the attachment.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @name : String | Nil = nil,
    )
    end
  end
end
