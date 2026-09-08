private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for CreateSpotDatafeedSubscription.
  class CreateSpotDatafeedSubscriptionRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The name of the Amazon S3 bucket in which to store the Spot Instance data feed. For more
    # information about bucket names, see [Bucket naming
    # rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html) in the
    # *Amazon S3 User Guide*.
    property bucket : String

    # The prefix for the data feed file names.
    property prefix : String | Nil

    def initialize(
      @bucket : String,
      @dry_run : Bool | Nil = nil,
      @prefix : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}Bucket", @bucket}

      if value = @prefix
        params << {"#{prefix}Prefix", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='bucket']")).not_nil!,
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='prefix']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @bucket, @prefix)
  end
end
