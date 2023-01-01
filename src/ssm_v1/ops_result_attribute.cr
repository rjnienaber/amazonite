module Amazonite::SsmV1
  class OpsResultAttribute
    include JSON::Serializable

    @[JSON::Field(key: "TypeName")]
    property type_name : String

    def initialize(
      @type_name : String
    )
    end
  end
end
