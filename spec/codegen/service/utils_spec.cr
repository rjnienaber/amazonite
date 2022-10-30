require "../../spec_helper"

describe Amazonite::Codegen::Service::Utils do
  described_class = Amazonite::Codegen::Service::Utils

  context "static methods" do
    subject = described_class

    describe "#snake_case_name" do
      it "handles 'BatchExecuteStatement'" do
        subject.snake_case_name("BatchExecuteStatement").should eq("batch_execute_statement")
      end

      it "handles 'DynamoDB'" do
        subject.snake_case_name("DynamoDB").should eq("dynamo_db")
      end

      it "handles 'KMSMasterKeyId'" do
        subject.snake_case_name("KMSMasterKeyId").should eq("kms_master_key_id")
      end
    end
  end
end
