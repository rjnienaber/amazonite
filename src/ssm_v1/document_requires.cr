module Amazonite::SsmV1
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
  end
end
