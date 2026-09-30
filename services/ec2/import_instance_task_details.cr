private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an import instance task.
  class ImportInstanceTaskDetails
    # A description of the task.
    property description : String | Nil

    # The ID of the instance.
    property instance_id : String | Nil

    # The instance operating system.
    property platform : PlatformValues | Nil

    # The volumes.
    property volumes : Array(ImportInstanceVolumeDetailItem) | Nil

    def initialize(
      @description : String | Nil = nil,
      @instance_id : String | Nil = nil,
      @platform : PlatformValues | Nil = nil,
      @volumes : Array(ImportInstanceVolumeDetailItem) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      if value = @platform
        params << {"#{prefix}Platform", value.to_json_object_key}
      end

      (@volumes || [] of ImportInstanceVolumeDetailItem).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Volumes.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        platform: (n = node.xpath_node("*[local-name()='platform']")) ? AEC::PlatformValues.from_json_object_key?(n.content) : nil,
        volumes: node.xpath_nodes("*[local-name()='volumes']/*[local-name()='item']").map { |n| ImportInstanceVolumeDetailItem.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @volumes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@description, @instance_id, @platform, @volumes)
  end
end
