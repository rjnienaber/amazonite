module Amazonite::SsmV1
  class DocumentRequires
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Version")]
    property version : String | Nil

    @[JSON::Field(key: "RequireType")]
    property require_type : String | Nil

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
