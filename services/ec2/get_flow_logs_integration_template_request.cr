private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetFlowLogsIntegrationTemplateRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the flow log.
    property flow_log_id : String

    # To store the CloudFormation template in Amazon S3, specify the location in Amazon S3.
    property config_delivery_s3_destination_arn : String

    # Information about the service integration.
    property integrate_services : IntegrateServices

    def initialize(
      @flow_log_id : String,
      @config_delivery_s3_destination_arn : String,
      @integrate_services : IntegrateServices,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}FlowLogId", @flow_log_id}

      params << {"#{prefix}ConfigDeliveryS3DestinationArn", @config_delivery_s3_destination_arn}

      params.concat(@integrate_services.to_query_params("#{prefix}IntegrateService."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        flow_log_id: Core::XMLValue.string(node.xpath_node("*[local-name()='FlowLogId']")).not_nil!,
        config_delivery_s3_destination_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ConfigDeliveryS3DestinationArn']")).not_nil!,
        integrate_services: node.xpath_node("*[local-name()='IntegrateService']").try { |n| IntegrateServices.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @integrate_services
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @flow_log_id, @config_delivery_s3_destination_arn, @integrate_services)
  end
end
