require "../spec_helper"

private alias AE = Amazonite::EC2
private alias AC = Amazonite::Core

describe "Ec2: basic vpc and tag operations" do
  name = "amazonite-integration-test-vpc"
  cidr = "10.42.0.0/16"
  client = AE::Client.new
  name_filter = AE::Filter.new(name: "tag:Name", values: [name])
  vpc_id = ""

  it "removes a leftover vpc" do
    request = AE::DescribeVpcsRequest.new(filters: [name_filter])
    vpcs = client.describe_vpcs(request).result.vpcs || [] of AE::Vpc
    vpcs.compact_map(&.vpc_id).each do |id|
      client.delete_vpc(AE::DeleteVpcRequest.new(vpc_id: id))
    end
  end

  it "creates a vpc" do
    response = client.create_vpc(AE::CreateVpcRequest.new(cidr_block: cidr))
    response.http.status_code.should eq(200)

    # ec2Query hangs the operation's members off the <CreateVpcResponse> root
    # rather than awsQuery's nested <CreateVpcResult>, so a parsed member here
    # is the protocol difference working.
    vpc = response.result.vpc || raise "expected a vpc in the response"
    vpc.cidr_block.should eq(cidr)
    vpc_id = vpc.vpc_id || raise "expected the new vpc to have an id"
    vpc_id.should start_with("vpc-")
  end

  it "tags the vpc" do
    tags = [AE::Tag.new(key: "Name", value: name)]
    response = client.create_tags(AE::CreateTagsRequest.new(resources: [vpc_id], tags: tags))
    response.http.status_code.should eq(200)
  end

  it "describes the vpc by tag filter" do
    request = AE::DescribeVpcsRequest.new(filters: [name_filter])
    response = client.describe_vpcs(request)
    response.http.status_code.should eq(200)

    vpcs = response.result.vpcs || [] of AE::Vpc
    vpcs.compact_map(&.vpc_id).should eq([vpc_id])
    tags = vpcs.first.tags || [] of AE::Tag
    tags.compact_map(&.value).should contain(name)
  end

  it "describes the vpc by id" do
    request = AE::DescribeVpcsRequest.new(vpc_ids: [vpc_id])
    response = client.describe_vpcs(request)
    response.http.status_code.should eq(200)

    vpc = (response.result.vpcs || [] of AE::Vpc).first
    vpc.state.should eq(AE::VpcState::Available)
    vpc.is_default.should be_false
  end

  it "describes the availability zones" do
    response = client.describe_availability_zones(AE::DescribeAvailabilityZonesRequest.new)
    response.http.status_code.should eq(200)

    zones = response.result.availability_zones || [] of AE::AvailabilityZone
    zones.should_not be_empty
    zones.compact_map(&.region_name).uniq!.should eq([ENV["AWS_REGION"]? || "us-west-2"])
  end

  it "deletes the vpc" do
    response = client.delete_vpc(AE::DeleteVpcRequest.new(vpc_id: vpc_id))
    response.http.status_code.should eq(200)

    request = AE::DescribeVpcsRequest.new(filters: [name_filter])
    (client.describe_vpcs(request).result.vpcs || [] of AE::Vpc).should be_empty
  end

  it "throws an error for an unknown vpc" do
    # EC2 models no errors of its own, so every failure comes back as the
    # generic exception the factory falls back to.
    request = AE::DescribeVpcsRequest.new(vpc_ids: ["vpc-00000000000000000"])
    e = expect_raises(AC::ResponseException) do
      client.describe_vpcs(request)
    end
    e.http.should_not be_nil
    e.message.should_not be_nil
  end
end
