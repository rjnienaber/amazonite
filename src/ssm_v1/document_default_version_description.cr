module Amazonite::SsmV1
  # A default version of a document.
  class DocumentDefaultVersionDescription
    include JSON::Serializable

    # The name of the document.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The default version of the document.
    @[JSON::Field(key: "DefaultVersion")]
    property default_version : String | Nil

    # The default version of the artifact associated with the document.
    @[JSON::Field(key: "DefaultVersionName")]
    property default_version_name : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @default_version : String | Nil = nil,
      @default_version_name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @default_version, @default_version_name)
  end
end
