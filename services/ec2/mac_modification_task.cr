private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a System Integrity Protection (SIP) modification task or volume ownership
  # delegation task for an Amazon EC2 Mac instance.
  class MacModificationTask
    # The ID of the Amazon EC2 Mac instance.
    property instance_id : String | Nil

    # The ID of task.
    property mac_modification_task_id : String | Nil

    # [SIP modification tasks only] Information about the SIP configuration.
    property mac_system_integrity_protection_config : MacSystemIntegrityProtectionConfiguration | Nil

    # The date and time the task was created, in the UTC timezone (`YYYY-MM-DDThh:mm:ss.sssZ`).
    property start_time : Time | Nil

    # The tags assigned to the task.
    property tags : Array(Tag) | Nil

    # The state of the task.
    property task_state : MacModificationTaskState | Nil

    # The type of task.
    property task_type : MacModificationTaskType | Nil

    def initialize(
      @instance_id : String | Nil = nil,
      @mac_modification_task_id : String | Nil = nil,
      @mac_system_integrity_protection_config : MacSystemIntegrityProtectionConfiguration | Nil = nil,
      @start_time : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @task_state : MacModificationTaskState | Nil = nil,
      @task_type : MacModificationTaskType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @mac_modification_task_id
        params << {"#{prefix}MacModificationTaskId", value}
      end

      if value = @mac_system_integrity_protection_config
        params.concat(value.to_query_params("#{prefix}MacSystemIntegrityProtectionConfig."))
      end

      if value = @start_time
        params << {"#{prefix}StartTime", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @task_state
        params << {"#{prefix}TaskState", value.to_json_object_key}
      end

      if value = @task_type
        params << {"#{prefix}TaskType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        mac_modification_task_id: Core::XMLValue.string(node.xpath_node("*[local-name()='macModificationTaskId']")),
        mac_system_integrity_protection_config: node.xpath_node("*[local-name()='macSystemIntegrityProtectionConfig']").try { |n| MacSystemIntegrityProtectionConfiguration.from_xml(n) },
        start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='startTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        task_state: (n = node.xpath_node("*[local-name()='taskState']")) ? AEC::MacModificationTaskState.from_json_object_key?(n.content) : nil,
        task_type: (n = node.xpath_node("*[local-name()='taskType']")) ? AEC::MacModificationTaskType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @mac_system_integrity_protection_config
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_id, @mac_modification_task_id, @mac_system_integrity_protection_config, @start_time, @tags, @task_state, @task_type)
  end
end
