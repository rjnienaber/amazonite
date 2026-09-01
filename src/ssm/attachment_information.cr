private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end
    end

    def_equals_and_hash(@name)
  end
end
