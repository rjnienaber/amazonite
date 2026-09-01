module Amazonite::ApiGateway
  # Represents a mapping template used to transform a payload.
  class Template
    include JSON::Serializable

    # The Apache Velocity Template Language (VTL) template content used for the template resource.
    @[JSON::Field(key: "value")]
    property value : String | Nil

    def initialize(
      @value : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@value)
  end
end
