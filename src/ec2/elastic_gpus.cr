private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Amazon Elastic Graphics reached end of life on January 8, 2024.
  #
  # Describes an Elastic Graphics accelerator.
  class ElasticGpus
    # The ID of the Elastic Graphics accelerator.
    property elastic_gpu_id : String | Nil

    # The Availability Zone in the which the Elastic Graphics accelerator resides.
    property availability_zone : String | Nil

    # The type of Elastic Graphics accelerator.
    property elastic_gpu_type : String | Nil

    # The status of the Elastic Graphics accelerator.
    property elastic_gpu_health : ElasticGpuHealth | Nil

    # The state of the Elastic Graphics accelerator.
    property elastic_gpu_state : ElasticGpuState | Nil

    # The ID of the instance to which the Elastic Graphics accelerator is attached.
    property instance_id : String | Nil

    # The tags assigned to the Elastic Graphics accelerator.
    property tags : Array(Tag) | Nil

    def initialize(
      @elastic_gpu_id : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @elastic_gpu_type : String | Nil = nil,
      @elastic_gpu_health : ElasticGpuHealth | Nil = nil,
      @elastic_gpu_state : ElasticGpuState | Nil = nil,
      @instance_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @elastic_gpu_id
        params << {"#{prefix}ElasticGpuId", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @elastic_gpu_type
        params << {"#{prefix}ElasticGpuType", value}
      end

      if value = @elastic_gpu_health
        params.concat(value.to_query_params("#{prefix}ElasticGpuHealth."))
      end

      if value = @elastic_gpu_state
        params << {"#{prefix}ElasticGpuState", value.to_json_object_key}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        elastic_gpu_id: Core::XMLValue.string(node.xpath_node("*[local-name()='elasticGpuId']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        elastic_gpu_type: Core::XMLValue.string(node.xpath_node("*[local-name()='elasticGpuType']")),
        elastic_gpu_health: node.xpath_node("*[local-name()='elasticGpuHealth']").try { |n| ElasticGpuHealth.from_xml(n) },
        elastic_gpu_state: (n = node.xpath_node("*[local-name()='elasticGpuState']")) ? AEC::ElasticGpuState.from_json_object_key?(n.content) : nil,
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @elastic_gpu_health
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@elastic_gpu_id, @availability_zone, @elastic_gpu_type, @elastic_gpu_health, @elastic_gpu_state, @instance_id, @tags)
  end
end
