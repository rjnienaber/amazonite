private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTrafficMirrorSessionResult
    # Information about the Traffic Mirror session.
    property traffic_mirror_session : TrafficMirrorSession | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [How to ensure
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    def initialize(
      @traffic_mirror_session : TrafficMirrorSession | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @traffic_mirror_session
        params.concat(value.to_query_params("#{prefix}TrafficMirrorSession."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_session: node.xpath_node("*[local-name()='trafficMirrorSession']").try { |n| TrafficMirrorSession.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
      )
    end

    def validate! : Nil
      if value = @traffic_mirror_session
        value.validate!
      end
    end

    def_equals_and_hash(@traffic_mirror_session, @client_token)
  end
end
