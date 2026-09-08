private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes address usage for a customer-owned address pool.
  class CoipAddressUsage
    # The allocation ID of the address.
    property allocation_id : String | Nil

    # The Amazon Web Services account ID.
    property aws_account_id : String | Nil

    # The Amazon Web Services service.
    property aws_service : String | Nil

    # The customer-owned IP address.
    property co_ip : String | Nil

    def initialize(
      @allocation_id : String | Nil = nil,
      @aws_account_id : String | Nil = nil,
      @aws_service : String | Nil = nil,
      @co_ip : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allocation_id
        params << {"#{prefix}AllocationId", value}
      end

      if value = @aws_account_id
        params << {"#{prefix}AwsAccountId", value}
      end

      if value = @aws_service
        params << {"#{prefix}AwsService", value}
      end

      if value = @co_ip
        params << {"#{prefix}CoIp", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='allocationId']")),
        aws_account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='awsAccountId']")),
        aws_service: Core::XMLValue.string(node.xpath_node("*[local-name()='awsService']")),
        co_ip: Core::XMLValue.string(node.xpath_node("*[local-name()='coIp']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allocation_id, @aws_account_id, @aws_service, @co_ip)
  end
end
