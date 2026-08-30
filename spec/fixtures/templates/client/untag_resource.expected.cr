private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class Client < Core::Client
    Log = ::Log.for("amazonite.dynamodb.client")

    def initialize(config = Core::Config.new)
      super("DynamoDB_20120810", "dynamodb", "1.0", nil, config)
    end

    # Removes the association of tags from an Amazon DynamoDB resource. You can call `UntagResource`
    # up to five times per second, per account.
    #
    # - `UntagResource` is an asynchronous operation. If you issue a ListTagsOfResource request
    # immediately after an `UntagResource` request, DynamoDB might return your previous tag set, if
    # there was one, or an empty tag set. This is because `ListTagsOfResource` uses an eventually
    # consistent query, and the metadata for your tags or table might not be available at that moment.
    # Wait for a few seconds, and then try the `ListTagsOfResource` request again.
    #
    # - The application or removal of tags using `TagResource` and `UntagResource` APIs is eventually
    # consistent. `ListTagsOfResource` API will only reflect the changes after a few seconds.
    #
    # For an overview on tagging DynamoDB resources, see [Tagging for
    # DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html) in the
    # *Amazon DynamoDB Developer Guide*.
    def untag_resource(input : ADDB::UntagResourceInput) : Core::Response
      Log.info { "performing 'UntagResource' operation" }
      input.validate! if config.validate_input?
      response = post("UntagResource", "/", input.to_json)
      Core::Response.new(response)
    end
  end
end
