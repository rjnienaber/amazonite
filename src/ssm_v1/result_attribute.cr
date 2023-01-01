module Amazonite::SsmV1
  class ResultAttribute
    include JSON::Serializable

    @[JSON::Field(key: "TypeName")]
    property type_name : String

    def initialize(
      @type_name : String
    )
    end
  end
end
