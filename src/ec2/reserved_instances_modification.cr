private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Reserved Instance modification.
  class ReservedInstancesModification
    # A unique, case-sensitive key supplied by the client to ensure that the request is idempotent.
    # For more information, see [Ensuring
    # Idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # The time when the modification request was created.
    property create_date : Time | Nil

    # The time for the modification to become effective.
    property effective_date : Time | Nil

    # Contains target configurations along with their corresponding new Reserved Instance IDs.
    property modification_results : Array(ReservedInstancesModificationResult) | Nil

    # The IDs of one or more Reserved Instances.
    property reserved_instances_ids : Array(ReservedInstancesId) | Nil

    # A unique ID for the Reserved Instance modification.
    property reserved_instances_modification_id : String | Nil

    # The status of the Reserved Instances modification request.
    property status : String | Nil

    # The reason for the status.
    property status_message : String | Nil

    # The time when the modification request was last updated.
    property update_date : Time | Nil

    def initialize(
      @client_token : String | Nil = nil,
      @create_date : Time | Nil = nil,
      @effective_date : Time | Nil = nil,
      @modification_results : Array(ReservedInstancesModificationResult) | Nil = nil,
      @reserved_instances_ids : Array(ReservedInstancesId) | Nil = nil,
      @reserved_instances_modification_id : String | Nil = nil,
      @status : String | Nil = nil,
      @status_message : String | Nil = nil,
      @update_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      if value = @effective_date
        params << {"#{prefix}EffectiveDate", Core::QueryValue.time(value)}
      end

      (@modification_results || [] of ReservedInstancesModificationResult).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ModificationResultSet.#{i}."))
      end

      (@reserved_instances_ids || [] of ReservedInstancesId).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ReservedInstancesSet.#{i}."))
      end

      if value = @reserved_instances_modification_id
        params << {"#{prefix}ReservedInstancesModificationId", value}
      end

      if value = @status
        params << {"#{prefix}Status", value}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      if value = @update_date
        params << {"#{prefix}UpdateDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='clientToken']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='createDate']")),
        effective_date: Core::XMLValue.time(node.xpath_node("*[local-name()='effectiveDate']")),
        modification_results: node.xpath_nodes("*[local-name()='modificationResultSet']/*[local-name()='item']").map { |n| ReservedInstancesModificationResult.from_xml(n) },
        reserved_instances_ids: node.xpath_nodes("*[local-name()='reservedInstancesSet']/*[local-name()='item']").map { |n| ReservedInstancesId.from_xml(n) },
        reserved_instances_modification_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesModificationId']")),
        status: Core::XMLValue.string(node.xpath_node("*[local-name()='status']")),
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        update_date: Core::XMLValue.time(node.xpath_node("*[local-name()='updateDate']")),
      )
    end

    def validate! : Nil
      if value = @modification_results
        value.each(&.validate!)
      end

      if value = @reserved_instances_ids
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@client_token, @create_date, @effective_date, @modification_results, @reserved_instances_ids, @reserved_instances_modification_id, @status, @status_message, @update_date)
  end
end
