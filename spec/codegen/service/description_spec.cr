require "../../spec_helper"

def create_description(schema_filename : String)
  source = ServiceJson.load(schema_filename)
  Amazonite::Codegen::Service::Description.new("0.23.2", "2012-08-10", "2", source)
end

describe Amazonite::Codegen::Service::Description do
  dynamodb_description = create_description("dynamodb-2012-08-10.normal.json")
  acm_pca_description = create_description("acm-pca-2017-08-22.normal.json")
  kinesis_analytics_description = create_description("kinesisanalyticsv2-2018-05-23.normal.json")
  waf_description = create_description("wafv2-2019-07-29.normal.json")
  elastic_loadbalancing_description = create_description("elasticloadbalancingv2-2015-12-01.normal.json")
  ses_description = create_description("sesv2-2019-09-27.normal.json")

  describe "#lower_name" do
    it "handles 'dynamodb'" do
      dynamodb_description.lower_name.should eq("dynamodb")
    end

    it "handles 'acm-pca'" do
      acm_pca_description.lower_name.should eq("acm_pca")
    end
  end

  describe "#module_name" do
    it "handles 'DynamoDB'" do
      dynamodb_description.module_name.should eq("Amazonite::DynamoDBV2")
    end

    it "handles 'ACM PCA'" do
      acm_pca_description.module_name.should eq("Amazonite::AcmPcaV2")
    end

    it "handles 'Kinesis Analytics V2'" do
      kinesis_analytics_description.module_name.should eq("Amazonite::KinesisAnalyticsV2")
    end

    it "handles 'WAFV2'" do
      waf_description.module_name.should eq("Amazonite::WafV2")
    end

    it "handles 'Elastic Load Balancing v2'" do
      elastic_loadbalancing_description.module_name.should eq("Amazonite::ElasticLoadBalancingV2")
    end

    it "handles 'SESv2'" do
      ses_description.module_name.should eq("Amazonite::SesV2")
    end
  end

  describe "#module_alias" do
    it "handles 'DynamoDB'" do
      dynamodb_description.module_alias.should eq("ADDB")
    end

    it "handles 'ACM PCA'" do
      acm_pca_description.module_alias.should eq("AAP")
    end
  end
end
