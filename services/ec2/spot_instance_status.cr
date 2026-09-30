private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the status of a Spot Instance request.
  class SpotInstanceStatus
    # The status code. For a list of status codes, see [Spot request status
    # codes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-request-status.html#spot-instance-request-status-understand)
    # in the *Amazon EC2 User Guide*.
    property code : String | Nil

    # The description for the status code.
    property message : String | Nil

    # The date and time of the most recent status update, in UTC format (for example,
    # *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z).
    property update_time : Time | Nil

    def initialize(
      @code : String | Nil = nil,
      @message : String | Nil = nil,
      @update_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @code
        params << {"#{prefix}Code", value}
      end

      if value = @message
        params << {"#{prefix}Message", value}
      end

      if value = @update_time
        params << {"#{prefix}UpdateTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        code: Core::XMLValue.string(node.xpath_node("*[local-name()='code']")),
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='message']")),
        update_time: Core::XMLValue.time(node.xpath_node("*[local-name()='updateTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @message, @update_time)
  end
end
