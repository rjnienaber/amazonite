module Amazonite::SsmV1
  class DocumentDefaultVersionDescription
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "DefaultVersion")]
    property default_version : String | Nil

    @[JSON::Field(key: "DefaultVersionName")]
    property default_version_name : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @default_version : String | Nil = nil,
      @default_version_name : String | Nil = nil
    )
    end
  end
end
