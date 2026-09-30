private alias Core = Amazonite::Core

module Amazonite::EC2
  # Amazon Elastic Graphics reached end of life on January 8, 2024.
  #
  # Describes the association between an instance and an Elastic Graphics accelerator.
  class ElasticGpuAssociation
    # The ID of the Elastic Graphics accelerator.
    property elastic_gpu_id : String | Nil

    # The ID of the association.
    property elastic_gpu_association_id : String | Nil

    # The state of the association between the instance and the Elastic Graphics accelerator.
    property elastic_gpu_association_state : String | Nil

    # The time the Elastic Graphics accelerator was associated with the instance.
    property elastic_gpu_association_time : String | Nil

    def initialize(
      @elastic_gpu_id : String | Nil = nil,
      @elastic_gpu_association_id : String | Nil = nil,
      @elastic_gpu_association_state : String | Nil = nil,
      @elastic_gpu_association_time : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @elastic_gpu_id
        params << {"#{prefix}ElasticGpuId", value}
      end

      if value = @elastic_gpu_association_id
        params << {"#{prefix}ElasticGpuAssociationId", value}
      end

      if value = @elastic_gpu_association_state
        params << {"#{prefix}ElasticGpuAssociationState", value}
      end

      if value = @elastic_gpu_association_time
        params << {"#{prefix}ElasticGpuAssociationTime", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        elastic_gpu_id: Core::XMLValue.string(node.xpath_node("*[local-name()='elasticGpuId']")),
        elastic_gpu_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='elasticGpuAssociationId']")),
        elastic_gpu_association_state: Core::XMLValue.string(node.xpath_node("*[local-name()='elasticGpuAssociationState']")),
        elastic_gpu_association_time: Core::XMLValue.string(node.xpath_node("*[local-name()='elasticGpuAssociationTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@elastic_gpu_id, @elastic_gpu_association_id, @elastic_gpu_association_state, @elastic_gpu_association_time)
  end
end
