private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class Client < Core::Client
    Log               = ::Log.for("amazonite.ec2.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AmazonEC2", "ec2", "1.0", EXCEPTION_FACTORY, config)
    end

    # Deletes the specified VPC. You must detach or delete all gateways and resources that are
    # associated with the VPC before you can delete it. For example, you must terminate all instances
    # running in the VPC, delete all security groups associated with the VPC (except the default one),
    # delete all route tables associated with the VPC (except the default one), and so on. When you
    # delete the VPC, it deletes the default security group, network ACL, and route table for the VPC.
    #
    # If you created a flow log for the VPC that you are deleting, note that flow logs for deleted
    # VPCs are eventually automatically removed.
    def delete_vpc(input : AEC::DeleteVpcRequest) : Core::Response
      Log.info { "performing 'DeleteVpc' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteVpc")
        form.add("Version", "2012-08-10")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteVpc", body)
      Core::Response.new(response)
    end
  end
end
