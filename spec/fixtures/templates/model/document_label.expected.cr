private alias Core = Amazonite::Core

module Amazonite::ComprehendV2
  # Specifies one of the label or labels that categorize the document being analyzed.
  class DocumentLabel
    include JSON::Serializable

    # The name of the label.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The confidence score that Amazon Comprehend has this label correctly attributed.
    @[JSON::Field(key: "Score")]
    property score : Float32 | Nil

    # Page number where the label occurs. This field is present in the response only if your request
    # includes the `Byte` parameter.
    @[JSON::Field(key: "Page")]
    property page : Int32 | Nil

    def initialize(
      @name : String | Nil = nil,
      @score : Float32 | Nil = nil,
      @page : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@name, @score, @page)
  end
end
