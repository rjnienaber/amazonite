private alias Core = Amazonite::Core

module Amazonite::EC2
  # Amazon Elastic Inference is no longer available.
  #
  # Describes the association between an instance and an elastic inference accelerator.
  class ElasticInferenceAcceleratorAssociation
    # The Amazon Resource Name (ARN) of the elastic inference accelerator.
    property elastic_inference_accelerator_arn : String | Nil

    # The ID of the association.
    property elastic_inference_accelerator_association_id : String | Nil

    # The state of the elastic inference accelerator.
    property elastic_inference_accelerator_association_state : String | Nil

    # The time at which the elastic inference accelerator is associated with an instance.
    property elastic_inference_accelerator_association_time : Time | Nil

    def initialize(
      @elastic_inference_accelerator_arn : String | Nil = nil,
      @elastic_inference_accelerator_association_id : String | Nil = nil,
      @elastic_inference_accelerator_association_state : String | Nil = nil,
      @elastic_inference_accelerator_association_time : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @elastic_inference_accelerator_arn
        params << {"#{prefix}ElasticInferenceAcceleratorArn", value}
      end

      if value = @elastic_inference_accelerator_association_id
        params << {"#{prefix}ElasticInferenceAcceleratorAssociationId", value}
      end

      if value = @elastic_inference_accelerator_association_state
        params << {"#{prefix}ElasticInferenceAcceleratorAssociationState", value}
      end

      if value = @elastic_inference_accelerator_association_time
        params << {"#{prefix}ElasticInferenceAcceleratorAssociationTime", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        elastic_inference_accelerator_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='elasticInferenceAcceleratorArn']")),
        elastic_inference_accelerator_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='elasticInferenceAcceleratorAssociationId']")),
        elastic_inference_accelerator_association_state: Core::XMLValue.string(node.xpath_node("*[local-name()='elasticInferenceAcceleratorAssociationState']")),
        elastic_inference_accelerator_association_time: Core::XMLValue.time(node.xpath_node("*[local-name()='elasticInferenceAcceleratorAssociationTime']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@elastic_inference_accelerator_arn, @elastic_inference_accelerator_association_id, @elastic_inference_accelerator_association_state, @elastic_inference_accelerator_association_time)
  end
end
