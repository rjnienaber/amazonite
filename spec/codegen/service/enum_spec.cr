require "../../spec_helper"

def create_enum(name, json_string : String)
  Amazonite::Codegen::Service::Enum.new(name, JSON.parse(json_string))
end

# TODO: use examples from json instead of listing it here
describe Amazonite::Codegen::Service::Enum do
  crystal_convention_json = <<-JSON
  {
    "type": "string",
    "enum": [
      "ConditionalCheckFailed",
      "ItemCollectionSizeLimitExceeded",
      "RequestLimitExceeded"
    ]
  }
  JSON

  screaming_snake_case_json = <<-JSON
  {
    "type": "string",
    "enum": [
      "PROVISIONED",
      "PAY_PER_REQUEST"
    ]
  }
  JSON

  all_upper_case_json = <<-JSON
  {
    "type": "string",
    "enum": [
      "ADD",
      "PUT",
      "DELETE"
    ]
  }
  JSON

  enums_with_numbers = <<-JSON
  {
    "type": "string",
    "enum": [
      "AES256",
      "KMS"
    ]
  }
  JSON

  enums_with_mixed_case = <<-JSON
  {
    "type": "string",
    "enum": [
      "RSA_2048",
      "RSA_4096",
      "EC_prime256v1",
      "EC_secp384r1"
    ]
  }
  JSON

  enums_with_colons = <<-JSON
  {
    "type": "string",
    "enum": [
      "ecs:service:DesiredCount",
      "ec2:spot-fleet-request:TargetCapacity",
      "dynamodb:table:ReadCapacityUnits",
      "dynamodb:index:ReadCapacityUnits",
      "elasticmapreduce:instancegroup:InstanceCount"
    ]
  }
  JSON

  enums_with_hyphens = <<-JSON
  {
    "type": "string",
    "enum": [
      "aws-flow-ruby",
      "java",
      "rails",
      "php",
      "ec2"
    ]
  }
  JSON

  enums_with_periods = <<-JSON
  {
    "type": "string",
    "enum": [
      "Standard",
      "CostCategoryExpression.v1",
      "G.025X"
    ]
  }
  JSON

  enums_with_mixed_case_and_hyphens = <<-JSON
  {
    "type": "string",
    "enum": [
      "ko",
      "zh",
      "zh-TW"
    ]
  }
  JSON

  enums_with_forward_slashes = <<-JSON
  {
    "type": "string",
    "enum": [
      "application/pdf",
      "AWS/Rekognition/DetectModerationLabels/Image/V3"
    ]
  }
  JSON

  enums_with_spaces = <<-JSON
  {
    "type": "string",
    "enum": [
      "Registered",
      "Topic not found"
    ]
  }
  JSON

  enums_with_non_word_characters = <<-JSON
  {
    "type": "string",
    "enum": [
      "One-Way: Outgoing",
      "One-Way: Incoming",
      "Two-Way"
    ]
  }
  JSON

  enums_with_hyphens_and_underscores = <<-JSON
  {
    "type": "string",
    "enum": [
      "SQL-1_0",
      "FLINK-1_6",
      "ZEPPELIN-FLINK-1_0",
      "FLINK-1_13"
    ]
  }
  JSON

  enums_that_are_versions = <<-JSON
  {
    "type": "string",
    "enum": [
      "5.1",
      "5.3"
    ]
  }
  JSON

  describe "#values" do
    it "handles values which matches Crystal coding convention" do
      values = create_enum("BatchStatementErrorCodeEnum", crystal_convention_json).values
      expected = [
        "ConditionalCheckFailed",
        "ItemCollectionSizeLimitExceeded",
        "RequestLimitExceeded",
      ]
      values.should eq(expected)
    end

    it "handles SCREAMING_SNAKE_CASED enums" do
      values = create_enum("BillingMode", screaming_snake_case_json).values
      values.should eq(["Provisioned", "PayPerRequest"])
    end

    it "handles all uppercase enums" do
      values = create_enum("AttributeAction", all_upper_case_json).values
      values.should eq(["Add", "Put", "Delete"])
    end

    it "handles enums with numbers" do
      values = create_enum("S3SseAlgorithm", enums_with_numbers).values
      values.should eq(["Aes256", "Kms"])
    end

    it "handles enums with mixed case" do
      values = create_enum("KeyAlgorithm", enums_with_mixed_case).values
      values.should eq(["Rsa2048", "Rsa4096", "EcPrime256v1", "EcSecp384r1"])
    end

    it "handles enums with colons" do
      values = create_enum("ScalableDimension", enums_with_colons).values
      values.should eq([
        "EcsServiceDesiredCount",
        "Ec2SpotFleetRequestTargetCapacity",
        "DynamodbTableReadCapacityUnits",
        "DynamodbIndexReadCapacityUnits",
        "ElasticmapreduceInstancegroupInstanceCount",
      ])
    end

    it "handles enums with hyphens" do
      values = create_enum("AppType", enums_with_hyphens).values
      values.should eq(["AwsFlowRuby", "Java", "Rails", "Php", "Ec2"])
    end

    it "handles enums with periods" do
      values = create_enum("CostCategoryRuleVersion", enums_with_periods).values
      values.should eq(["Standard", "CostCategoryExpressionV1", "G025x"])
    end

    it "handles mixed case with hyphens" do
      values = create_enum("LanguageCode", enums_with_mixed_case_and_hyphens).values
      values.should eq(["Ko", "Zh", "ZhTw"])
    end

    it "handles forward slashes" do
      values = create_enum("LoaContentType", enums_with_forward_slashes).values
      values.should eq(["ApplicationPdf", "AwsRekognitionDetectModerationLabelsImageV3"])
    end

    it "handles spaces" do
      values = create_enum("TopicStatus", enums_with_spaces).values
      values.should eq(["Registered", "TopicNotFound"])
    end

    it "handles non-word characters" do
      values = create_enum("TrustDirection", enums_with_non_word_characters).values
      values.should eq(["OneWayOutgoing", "OneWayIncoming", "TwoWay"])
    end

    it "handles hyphens and underscores" do
      values = create_enum("RuntimeEnvironment", enums_with_hyphens_and_underscores).values
      values.should eq(["Sql10", "Flink16", "ZeppelinFlink10", "Flink113"])
    end
  end

  describe "#aws_mappings" do
    it "no mapping when enum casing matches Crystal coding convention" do
      mappings = create_enum("BatchStatementErrorCodeEnum", crystal_convention_json).aws_mappings
      mappings.should be_empty
    end

    it "handles SCREAMING_SNAKE_CASED enums" do
      mappings = create_enum("BatchStatementErrorCodeEnum", screaming_snake_case_json).aws_mappings
      expected = [
        {"BatchStatementErrorCodeEnum::Provisioned", "PROVISIONED"},
        {"BatchStatementErrorCodeEnum::PayPerRequest", "PAY_PER_REQUEST"},
      ]
      mappings.should eq(expected)
    end

    it "handles all uppercase enums" do
      mappings = create_enum("AttributeAction", all_upper_case_json).aws_mappings
      expected = [
        {"AttributeAction::Add", "ADD"},
        {"AttributeAction::Put", "PUT"},
        {"AttributeAction::Delete", "DELETE"},
      ]

      mappings.should eq(expected)
    end

    it "handles enums with numbers" do
      mappings = create_enum("S3SseAlgorithm", enums_with_numbers).aws_mappings
      expected = [
        {"S3SseAlgorithm::Aes256", "AES256"},
        {"S3SseAlgorithm::Kms", "KMS"},
      ]

      mappings.should eq(expected)
    end

    it "handles enums with mixed case" do
      mappings = create_enum("KeyAlgorithm", enums_with_mixed_case).aws_mappings
      expected = [
        {"KeyAlgorithm::Rsa2048", "RSA_2048"},
        {"KeyAlgorithm::Rsa4096", "RSA_4096"},
        {"KeyAlgorithm::EcPrime256v1", "EC_prime256v1"},
        {"KeyAlgorithm::EcSecp384r1", "EC_secp384r1"},
      ]

      mappings.should eq(expected)
    end

    it "handles enums with colons" do
      mappings = create_enum("ScalableDimension", enums_with_colons).aws_mappings
      expected = [
        {"ScalableDimension::EcsServiceDesiredCount", "ecs:service:DesiredCount"},
        {"ScalableDimension::Ec2SpotFleetRequestTargetCapacity", "ec2:spot-fleet-request:TargetCapacity"},
        {"ScalableDimension::DynamodbTableReadCapacityUnits", "dynamodb:table:ReadCapacityUnits"},
        {"ScalableDimension::DynamodbIndexReadCapacityUnits", "dynamodb:index:ReadCapacityUnits"},
        {"ScalableDimension::ElasticmapreduceInstancegroupInstanceCount",
         "elasticmapreduce:instancegroup:InstanceCount"},
      ]

      mappings.should eq(expected)
    end

    it "handles enums with hyphens" do
      mappings = create_enum("AppType", enums_with_hyphens).aws_mappings
      expected = [
        {"AppType::AwsFlowRuby", "aws-flow-ruby"},
        {"AppType::Java", "java"},
        {"AppType::Rails", "rails"},
        {"AppType::Php", "php"},
        {"AppType::Ec2", "ec2"},
      ]

      mappings.should eq(expected)
    end

    it "handles enums that are versions" do
      mappings = create_enum("ClientVersion", enums_that_are_versions).aws_mappings
      expected = [
        {"ClientVersion::V51", "5.1"},
        {"ClientVersion::V53", "5.3"},
      ]

      mappings.should eq(expected)
    end
  end

  describe "#crystal_mappings" do
    it "handles enums with colons" do
      mappings = create_enum("ScalableDimension", enums_with_colons).crystal_mappings
      expected = [
        {"ecs:service:DesiredCount", "ScalableDimension::EcsServiceDesiredCount"},
        {"ec2:spot-fleet-request:TargetCapacity", "ScalableDimension::Ec2SpotFleetRequestTargetCapacity"},
        {"dynamodb:table:ReadCapacityUnits", "ScalableDimension::DynamodbTableReadCapacityUnits"},
        {"dynamodb:index:ReadCapacityUnits", "ScalableDimension::DynamodbIndexReadCapacityUnits"},
        {"elasticmapreduce:instancegroup:InstanceCount", "ScalableDimension::ElasticmapreduceInstancegroupInstanceCount"},
      ]
      mappings.should eq(expected)
    end

    it "handles enums that are versions" do
      mappings = create_enum("ClientVersion", enums_that_are_versions).crystal_mappings
      mappings.should eq([{"5.1", "ClientVersion::V51"}, {"5.3", "ClientVersion::V53"}])
    end
  end
end
