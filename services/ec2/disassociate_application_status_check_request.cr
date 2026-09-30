private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateApplicationStatusCheckRequest
    # The ID of the application status check to disassociate.
    property application_status_check_id : String

    # The [tags](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html) to disassociate
    # from the application status check. Specify the same key-value pairs that were used during
    # association.
    property target_tag_associations : Array(CustomTagKeyValueRequestPair) | Nil

    # The IDs of the instances to disassociate from the application status check.
    property instance_ids : Array(String) | Nil

    # A unique, case-sensitive identifier that you provide to ensure that the operation completes no
    # more than one time. If you retry a request with the same token, the service ignores the request
    # but does not return an error. For more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html).
    property client_token : String | Nil

    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @application_status_check_id : String,
      @target_tag_associations : Array(CustomTagKeyValueRequestPair) | Nil = nil,
      @instance_ids : Array(String) | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ApplicationStatusCheckId", @application_status_check_id}

      (@target_tag_associations || [] of CustomTagKeyValueRequestPair).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TargetTagAssociation.#{i}."))
      end

      (@instance_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}InstanceId.#{i}", item}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        application_status_check_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ApplicationStatusCheckId']")).not_nil!,
        target_tag_associations: node.xpath_nodes("*[local-name()='TargetTagAssociation']/*[local-name()='item']").map { |n| CustomTagKeyValueRequestPair.from_xml(n) },
        instance_ids: node.xpath_nodes("*[local-name()='InstanceId']/*[local-name()='item']").map { |n| n.content },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @target_tag_associations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@application_status_check_id, @target_tag_associations, @instance_ids, @client_token, @dry_run)
  end
end
