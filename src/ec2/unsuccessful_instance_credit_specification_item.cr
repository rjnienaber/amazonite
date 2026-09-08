private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the burstable performance instance whose credit option for CPU usage was not modified.
  class UnsuccessfulInstanceCreditSpecificationItem
    # The ID of the instance.
    property instance_id : String | Nil

    # The applicable error for the burstable performance instance whose credit option for CPU usage
    # was not modified.
    property error : UnsuccessfulInstanceCreditSpecificationItemError | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @error : UnsuccessfulInstanceCreditSpecificationItemError | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @error
        params.concat(value.to_query_params("#{prefix}Error."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        error: node.xpath_node("*[local-name()='error']").try { |n| UnsuccessfulInstanceCreditSpecificationItemError.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@instance_id, @error)
  end
end
