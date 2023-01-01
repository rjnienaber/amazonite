module Amazonite::SsmV1
  class DocumentRequires
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Version")]
    property version : String | Nil

    def initialize(
      @name : String,
      @version : String | Nil = nil
    )
    end
  end
end
