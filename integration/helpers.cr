{% if flag?(:aws) %}
  TEST_TARGET = :aws
{% else %}
  TEST_TARGET = :localstack
{% end %}

module Spec
  module Expectations
    def target_aws?
      TEST_TARGET == :aws
    end

    def target_localstack?
      TEST_TARGET == :localstack
    end

    def aws_value(val)
      target_aws? ? val : nil
    end

    def localstack_value(val)
      target_localstack? ? val : nil
    end
  end
end
