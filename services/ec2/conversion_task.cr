private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a conversion task.
  class ConversionTask
    # The ID of the conversion task.
    property conversion_task_id : String | Nil

    # The time when the task expires. If the upload isn't complete before the expiration time, we
    # automatically cancel the task.
    property expiration_time : String | Nil

    # If the task is for importing an instance, this contains information about the import instance
    # task.
    property import_instance : ImportInstanceTaskDetails | Nil

    # If the task is for importing a volume, this contains information about the import volume task.
    property import_volume : ImportVolumeTaskDetails | Nil

    # The state of the conversion task.
    property state : ConversionTaskState | Nil

    # The status message related to the conversion task.
    property status_message : String | Nil

    # Any tags assigned to the task.
    property tags : Array(Tag) | Nil

    def initialize(
      @conversion_task_id : String | Nil = nil,
      @expiration_time : String | Nil = nil,
      @import_instance : ImportInstanceTaskDetails | Nil = nil,
      @import_volume : ImportVolumeTaskDetails | Nil = nil,
      @state : ConversionTaskState | Nil = nil,
      @status_message : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @conversion_task_id
        params << {"#{prefix}ConversionTaskId", value}
      end

      if value = @expiration_time
        params << {"#{prefix}ExpirationTime", value}
      end

      if value = @import_instance
        params.concat(value.to_query_params("#{prefix}ImportInstance."))
      end

      if value = @import_volume
        params.concat(value.to_query_params("#{prefix}ImportVolume."))
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        conversion_task_id: Core::XMLValue.string(node.xpath_node("*[local-name()='conversionTaskId']")),
        expiration_time: Core::XMLValue.string(node.xpath_node("*[local-name()='expirationTime']")),
        import_instance: node.xpath_node("*[local-name()='importInstance']").try { |n| ImportInstanceTaskDetails.from_xml(n) },
        import_volume: node.xpath_node("*[local-name()='importVolume']").try { |n| ImportVolumeTaskDetails.from_xml(n) },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::ConversionTaskState.from_json_object_key?(n.content) : nil,
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @import_instance
        value.validate!
      end

      if value = @import_volume
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@conversion_task_id, @expiration_time, @import_instance, @import_volume, @state, @status_message, @tags)
  end
end
