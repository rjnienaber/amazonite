private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an unsuccessful application status check suppression.
  class UnsuccessfulSuppressionResponseObject
    # The ID of the instance.
    property instance_id : String | Nil

    # The date and time when suppression was attempted.
    property suppress_at : Time | Nil

    # The date and time when health checks would have resumed.
    property resume_at : Time | Nil

    # The reason the suppression failed.
    property reason : String | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @suppress_at : Time | Nil = nil,
      @resume_at : Time | Nil = nil,
      @reason : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @suppress_at
        params << {"#{prefix}SuppressAt", Core::QueryValue.time(value)}
      end

      if value = @resume_at
        params << {"#{prefix}ResumeAt", Core::QueryValue.time(value)}
      end

      if value = @reason
        params << {"#{prefix}Reason", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        suppress_at: Core::XMLValue.time(node.xpath_node("*[local-name()='suppressAt']")),
        resume_at: Core::XMLValue.time(node.xpath_node("*[local-name()='resumeAt']")),
        reason: Core::XMLValue.string(node.xpath_node("*[local-name()='reason']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_id, @suppress_at, @resume_at, @reason)
  end
end
