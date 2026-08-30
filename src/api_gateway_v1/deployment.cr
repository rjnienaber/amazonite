private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # An immutable representation of a RestApi resource that can be called by users using Stages. A
  # deployment must be associated with a Stage for it to be callable over the Internet.
  class Deployment
    include JSON::Serializable

    # The identifier for the deployment resource.
    @[JSON::Field(key: "id")]
    property id : String | Nil

    # The description for the deployment resource.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The date and time that the deployment resource was created.
    @[JSON::Field(key: "createdDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # A summary of the RestApi at the date and time that the deployment resource was created.
    @[JSON::Field(key: "apiSummary")]
    property api_summary : Hash(String, Hash(String, MethodSnapshot)) | Nil

    def initialize(
      @id : String | Nil = nil,
      @description : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @api_summary : Hash(String, Hash(String, MethodSnapshot)) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @description, @created_date, @api_summary)
  end
end
