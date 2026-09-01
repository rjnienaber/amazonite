private alias Core = Amazonite::Core

module Amazonite::Ssm
  # An SSM document required by the current document.
  class DocumentRequires
    include JSON::Serializable

    # The name of the required SSM document. The name can be an Amazon Resource Name (ARN).
    @[JSON::Field(key: "Name")]
    property name : String

    # The document version required by the current document.
    @[JSON::Field(key: "Version")]
    property version : String | Nil

    # The document type of the required SSM document.
    @[JSON::Field(key: "RequireType")]
    property require_type : String | Nil

    # An optional field specifying the version of the artifact associated with the document. For
    # example, 12.6. This value is unique across all versions of a document, and can't be changed.
    @[JSON::Field(key: "VersionName")]
    property version_name : String | Nil

    def initialize(
      @name : String,
      @version : String | Nil = nil,
      @require_type : String | Nil = nil,
      @version_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.:/]{3,128}$"))
      end

      if value = @version
        raise Core::ValidationError.new("Version does not match the required pattern") unless value.matches?(Regex.new("^([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)$"))
      end

      if value = @require_type
        raise Core::ValidationError.new("RequireType length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("RequireType length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("RequireType does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{1,128}$"))
      end

      if value = @version_name
        raise Core::ValidationError.new("VersionName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{1,128}$"))
      end
    end

    def_equals_and_hash(@name, @version, @require_type, @version_name)
  end
end
