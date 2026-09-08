private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Provides a summary of the application-level health status for an instance.
  class ApplicationStatusSummary
    # The current status.
    property status : SummaryStatus | Nil

    # The date and time when the application status became impaired.
    property impaired_since : Time | Nil

    def initialize(
      @status : SummaryStatus | Nil = nil,
      @impaired_since : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @impaired_since
        params << {"#{prefix}ImpairedSince", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::SummaryStatus.from_json_object_key?(n.content) : nil,
        impaired_since: Core::XMLValue.time(node.xpath_node("*[local-name()='impairedSince']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status, @impaired_since)
  end
end
