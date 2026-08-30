require "../spec_helper"

private alias ACF = Amazonite::CloudFormation
private alias AC = Amazonite::Core

private def wait_until_complete(client, stack_name, attempts = 60)
  attempts.times do
    response = client.describe_stacks(ACF::DescribeStacksInput.new(stack_name))
    stack = (response.result.stacks || [] of ACF::Stack).first?
    return stack if stack && {ACF::StackStatus::CreateComplete, ACF::StackStatus::DeleteComplete}.includes?(stack.stack_status)

    sleep 1.second
  rescue AC::ResponseException
    # DescribeStacks raises a generic ValidationError (not a dedicated
    # exception type) once the stack no longer exists at all.
    return
  end

  raise "timed out waiting for '#{stack_name}' to reach a terminal status"
end

describe "CloudFormation: basic stack operations" do
  stack_name = "amazonite-integration-test-stack"
  client = ACF::Client.new
  template_body = %({"Resources": {"Handle": {"Type": "AWS::CloudFormation::WaitConditionHandle"}}})

  it "removes an existing stack" do
    client.delete_stack(ACF::DeleteStackInput.new(stack_name))
    wait_until_complete(client, stack_name)
  rescue AC::ResponseException
  end

  it "creates a stack" do
    request = ACF::CreateStackInput.new(stack_name, template_body: template_body)
    response = client.create_stack(request)
    response.http.status_code.should eq(200)

    stack_id = response.result.stack_id || raise "expected a stack id in the response"
    stack_id.should_not be_empty

    stack = wait_until_complete(client, stack_name) || raise "expected the stack to exist"
    stack.stack_status.should eq(ACF::StackStatus::CreateComplete)
  end

  it "describes the stack" do
    response = client.describe_stacks(ACF::DescribeStacksInput.new(stack_name))
    response.http.status_code.should eq(200)

    stacks = response.result.stacks || [] of ACF::Stack
    stacks.map(&.stack_name).should eq([stack_name])
    stacks[0].creation_time.should be_a(Time)
  end

  it "lists stacks" do
    response = client.list_stacks(ACF::ListStacksInput.new)
    response.http.status_code.should eq(200)

    summaries = response.result.stack_summaries || [] of ACF::StackSummary
    names = summaries.select { |summary| summary.stack_status == ACF::StackStatus::CreateComplete }.map(&.stack_name)
    names.should contain(stack_name)
  end

  it "deletes the stack" do
    response = client.delete_stack(ACF::DeleteStackInput.new(stack_name))
    response.http.status_code.should eq(200)

    wait_until_complete(client, stack_name)
  end

  it "throws an error for a nonexistent stack" do
    e = expect_raises(AC::ResponseException) do
      client.describe_stacks(ACF::DescribeStacksInput.new("amazonite-nonexistent-stack"))
    end
    e.http.should_not be_nil
    e.message.should_not be_nil
  end
end
