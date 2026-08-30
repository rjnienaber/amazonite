module Amazonite::ApiGatewayV1
  # Get an SdkType instance.
  class GetSdkTypeRequest
    include JSON::Serializable

    # The identifier of the queried SdkType instance.
    @[JSON::Field(key: "id", ignore: true)]
    property id : String = ""

    def initialize(
      @id : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id)
  end
end
