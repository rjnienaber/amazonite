private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableImageDeprecationRequest
    # The ID of the AMI.
    property image_id : String

    # The date and time to deprecate the AMI, in UTC, in the following format:
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z. If you specify a value for seconds, Amazon EC2 rounds the
    # seconds to the nearest minute.
    #
    # You can’t specify a date in the past. The upper limit for `DeprecateAt` is 10 years from now,
    # except for public AMIs, where the upper limit is 2 years from the creation date.
    property deprecate_at : Time

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @image_id : String,
      @deprecate_at : Time,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ImageId", @image_id}

      params << {"#{prefix}DeprecateAt", Core::QueryValue.time(@deprecate_at)}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        deprecate_at: Core::XMLValue.time(node.xpath_node("*[local-name()='DeprecateAt']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@image_id, @deprecate_at, @dry_run)
  end
end
