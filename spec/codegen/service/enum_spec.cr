require "../../spec_helper"

def create_enum(name, json_string : String)
  Amazonite::Codegen::Service::Enum.new(name, JSON.parse(json_string), "DynamoDB")
end

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
  end

  describe "#mappings" do
    it "no mapping when enum casing matches Crystal coding convention" do
      mappings = create_enum("", crystal_convention_json).aws_mappings
      mappings.should be_nil
    end

    it "handles SCREAMING_SNAKE_CASED enums" do
      mappings = create_enum("BatchStatementErrorCodeEnum", screaming_snake_case_json).aws_mappings
      expected = [
        {"Amazonite::DynamoDB::BatchStatementErrorCodeEnum::Provisioned", "  ", "PROVISIONED"},
        {"Amazonite::DynamoDB::BatchStatementErrorCodeEnum::PayPerRequest", "", "PAY_PER_REQUEST"},
      ]
      mappings.should eq(expected)
    end

    it "handles all uppercase enums" do
      mappings = create_enum("AttributeAction", all_upper_case_json).aws_mappings
      expected = [
        {"Amazonite::DynamoDB::AttributeAction::Add", "   ", "ADD"},
        {"Amazonite::DynamoDB::AttributeAction::Put", "   ", "PUT"},
        {"Amazonite::DynamoDB::AttributeAction::Delete", "", "DELETE"},
      ]

      mappings.should eq(expected)
    end

    it "handles enums with numbers" do
      mappings = create_enum("S3SseAlgorithm", enums_with_numbers).aws_mappings
      expected = [
        {"Amazonite::DynamoDB::S3SseAlgorithm::Aes256", "", "AES256"},
        {"Amazonite::DynamoDB::S3SseAlgorithm::Kms", "   ", "KMS"},
      ]

      mappings.should eq(expected)
    end
  end
end
