private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class RollbackConfiguration
    property rollback_triggers : Array(RollbackTrigger) | Nil

    property monitoring_time_in_minutes : Int32 | Nil

    def initialize(
      @rollback_triggers : Array(RollbackTrigger) | Nil = nil,
      @monitoring_time_in_minutes : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@rollback_triggers || [] of RollbackTrigger).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RollbackTriggers.member.#{i}."))
      end

      if value = @monitoring_time_in_minutes
        params << {"#{prefix}MonitoringTimeInMinutes", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        rollback_triggers: node.xpath_nodes("*[local-name()='RollbackTriggers']/*[local-name()='member']").map { |n| RollbackTrigger.from_xml(n) },
        monitoring_time_in_minutes: Core::XMLValue.i32(node.xpath_node("*[local-name()='MonitoringTimeInMinutes']")),
      )
    end
  end
end
