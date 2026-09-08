private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Provides a summary of the attached EBS volume status for an instance.
  class EbsStatusSummary
    # Details about the attached EBS status check for an instance.
    property details : Array(EbsStatusDetails) | Nil

    # The current status.
    property status : SummaryStatus | Nil

    def initialize(
      @details : Array(EbsStatusDetails) | Nil = nil,
      @status : SummaryStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@details || [] of EbsStatusDetails).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Details.#{i}."))
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        details: node.xpath_nodes("*[local-name()='details']/*[local-name()='item']").map { |n| EbsStatusDetails.from_xml(n) },
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::SummaryStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @details
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@details, @status)
  end
end
