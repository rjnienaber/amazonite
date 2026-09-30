private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class PutDestinationPolicyRequest
    include JSON::Serializable

    # A name for an existing destination.
    @[JSON::Field(key: "destinationName")]
    property destination_name : String

    # An IAM policy document that authorizes cross-account users to deliver their log events to the
    # associated destination. This can be up to 5120 bytes.
    @[JSON::Field(key: "accessPolicy")]
    property access_policy : String

    # Specify true if you are updating an existing destination policy to grant permission to an
    # organization ID instead of granting permission to individual Amazon Web Services accounts.
    # Before you update a destination policy this way, you must first update the subscription filters
    # in the accounts that send logs to this destination. If you do not, the subscription filters
    # might stop working. By specifying `true` for `forceUpdate`, you are affirming that you have
    # already updated the subscription filters. For more information, see [ Updating an existing
    # cross-account
    # subscription](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Cross-Account-Log_Subscription-Update.html)
    #
    # If you omit this parameter, the default of `false` is used.
    @[JSON::Field(key: "forceUpdate")]
    property force_update : Bool | Nil

    def initialize(
      @destination_name : String,
      @access_policy : String,
      @force_update : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @destination_name
        raise Core::ValidationError.new("destinationName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("destinationName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("destinationName does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end

      if value = @access_policy
        raise Core::ValidationError.new("accessPolicy length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@destination_name, @access_policy, @force_update)
  end
end
