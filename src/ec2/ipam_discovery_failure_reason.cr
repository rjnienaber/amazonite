private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The discovery failure reason.
  class IpamDiscoveryFailureReason
    # The discovery failure code.
    #
    # - `assume-role-failure` - IPAM could not assume the Amazon Web Services IAM service-linked role.
    # This could be because of any of the following:
    #
    # - SLR has not been created yet and IPAM is still creating it.
    #
    # - You have opted-out of the IPAM home Region.
    #
    # - Account you are using as your IPAM account has been suspended.
    #
    # - `throttling-failure` - IPAM account is already using the allotted transactions per second and
    # IPAM is receiving a throttling error when assuming the Amazon Web Services IAM SLR.
    #
    # - `unauthorized-failure` - Amazon Web Services account making the request is not authorized. For
    # more information, see
    # [AuthFailure](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/errors-overview.html) in
    # the *Amazon Elastic Compute Cloud API Reference*.
    property code : IpamDiscoveryFailureCode | Nil

    # The discovery failure message.
    property message : String | Nil

    def initialize(
      @code : IpamDiscoveryFailureCode | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @code
        params << {"#{prefix}Code", value.to_json_object_key}
      end

      if value = @message
        params << {"#{prefix}Message", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        code: (n = node.xpath_node("*[local-name()='code']")) ? AEC::IpamDiscoveryFailureCode.from_json_object_key?(n.content) : nil,
        message: Core::XMLValue.string(node.xpath_node("*[local-name()='message']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @message)
  end
end
