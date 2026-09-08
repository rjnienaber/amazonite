private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class Client < Core::Client
    Log               = ::Log.for("amazonite.ec2.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AmazonEC2", "ec2", "1.0", EXCEPTION_FACTORY, config)
    end

    # Describes your VPCs. The default is to describe all your VPCs. Alternatively, you can specify
    # specific VPC IDs or filter the results to include only the VPCs that match specific criteria.
    def describe_vpcs(input : AEC::DescribeVpcsRequest) : Core::ParsedResponse(AEC::DescribeVpcsResult)
      Log.info { "performing 'DescribeVpcs' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeVpcs")
        form.add("Version", "2012-08-10")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeVpcs", body)
      result_node = XML.parse(response.body).root.not_nil!
      result = AEC::DescribeVpcsResult.from_xml(result_node)
      Core::ParsedResponse(AEC::DescribeVpcsResult).new(response, result)
    end
  end
end
